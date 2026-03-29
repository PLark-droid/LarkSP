#!/bin/bash
# codex-restart.sh - Restart Hook for Codex Halt Monitor
# Version: 1.0.0
# Description: Handles automatic restart with safety checks

set -euo pipefail

# ============================================================
# Configuration
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

LOG_DIR="$PROJECT_ROOT/.ai/logs"
RESTART_LOG="$LOG_DIR/codex-restart-$(date +%Y-%m-%d).log"

RESTART_COUNT_FILE="/tmp/miyabi-codex-restart-count"
MAX_RESTARTS=3
COOLDOWN_SECONDS=60

mkdir -p "$LOG_DIR"

# ============================================================
# Functions
# ============================================================

log() {
  local level="$1"
  shift
  local msg="$*"
  echo "[$(date -Iseconds)] [$level] $msg" | tee -a "$RESTART_LOG"
}

voicevox_notify() {
  local text="$1"

  # Check if VOICEVOX is available
  if ! command -v curl &>/dev/null; then
    return
  fi

  if ! nc -z 127.0.0.1 50021 2>/dev/null; then
    return
  fi

  # Generate audio
  local encoded_text=$(echo "$text" | python3 -c "import sys, urllib.parse; print(urllib.parse.quote(sys.stdin.read()))")

  curl -s -X POST "http://127.0.0.1:50021/audio_query?text=${encoded_text}&speaker=3" \
    | curl -s -X POST -H "Content-Type: application/json" -d @- \
      "http://127.0.0.1:50021/synthesis?speaker=3" -o /tmp/codex-restart.wav

  afplay /tmp/codex-restart.wav &>/dev/null &
}

macos_notify() {
  local title="$1"
  local message="$2"

  local safe_title safe_message
  safe_title=$(echo "$title" | sed "s/[\"\\\\]/'/g")
  safe_message=$(echo "$message" | sed "s/[\"\\\\]/'/g")
  osascript -e "display notification \"$safe_message\" with title \"$safe_title\"" 2>/dev/null || true
}

# ============================================================
# Main Logic
# ============================================================

main() {
  # Read metadata from stdin
  local meta
  meta=$(cat)

  local event_id=$(echo "$meta" | jq -r '.eventId // "unknown"')
  local reason=$(echo "$meta" | jq -r '.reason // "Unknown reason"')
  local severity=$(echo "$meta" | jq -r '.severity // "P0"')
  local exit_code=$(echo "$meta" | jq -r '.details.exitCode // "unknown"')

  log "INFO" "Restart triggered: $reason (severity=$severity, exit_code=$exit_code, event_id=$event_id)"

  # ============================================================
  # Safety Check: Restart Count
  # ============================================================

  local restart_count=0
  if [ -f "$RESTART_COUNT_FILE" ]; then
    restart_count=$(cat "$RESTART_COUNT_FILE")
  fi

  restart_count=$((restart_count + 1))
  echo "$restart_count" > "$RESTART_COUNT_FILE"

  log "INFO" "Restart attempt $restart_count/$MAX_RESTARTS"

  # Check if max restarts exceeded
  if [ "$restart_count" -gt "$MAX_RESTARTS" ]; then
    log "ERROR" "Max restart limit reached ($MAX_RESTARTS). Stopping auto-restart."

    macos_notify "🚨 Miyabi Alert" "Codex crashed $restart_count times. Manual intervention required."
    voicevox_notify "コーデックスが、${restart_count}回クラッシュしました。手動での対応が必要です。"

    # Reset counter after cooldown
    (sleep "$COOLDOWN_SECONDS" && rm -f "$RESTART_COUNT_FILE") &

    echo "❌ Max restarts exceeded. Check logs: $RESTART_LOG" >&2
    exit 1
  fi

  # ============================================================
  # Exponential Backoff
  # ============================================================

  local backoff_seconds=$((2 ** (restart_count - 1)))
  log "INFO" "Waiting ${backoff_seconds}s before restart (exponential backoff)"

  sleep "$backoff_seconds"

  # ============================================================
  # Trigger Restart Signal
  # ============================================================

  log "INFO" "✅ Restart triggered (attempt $restart_count/$MAX_RESTARTS)"

  # Notifications
  macos_notify "🔄 Miyabi Codex" "Restarting Codex (attempt $restart_count/$MAX_RESTARTS)"
  voicevox_notify "コーデックスが再起動されました。リトライ、${restart_count}回目です。"

  # Note: Actual restart is handled by parent process (codex-monitor.sh)
  # This hook only logs and notifies

  # Reset counter after successful operation (with cooldown)
  (sleep "$COOLDOWN_SECONDS" && rm -f "$RESTART_COUNT_FILE") &

  exit 0
}

# ============================================================
# Entry Point
# ============================================================

if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
  main "$@"
fi
