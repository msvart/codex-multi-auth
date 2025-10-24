#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_AUTH="$(cd "$SCRIPT_DIR/.." && pwd)/auth.json"

usage() {
	echo "Usage:"
	echo "  codex-profile.sh [private|business]"
	echo "  codex-profile [private|business]"
	exit 1
}

profile="${1:-}"
case "$profile" in
	private)
		SOURCE_AUTH="$SCRIPT_DIR/private_auth.json"
		success_msg="✅ Switched Codex to PRIVATE profile"
		;;
	business|biz)
		SOURCE_AUTH="$SCRIPT_DIR/business_auth.json"
		success_msg="✅ Switched Codex to BUSINESS profile"
		;;
	*)
		usage
		;;
esac

if [[ ! -f "$SOURCE_AUTH" ]]; then
	echo "Profile file not found: $SOURCE_AUTH" >&2
	exit 1
fi

cp "$SOURCE_AUTH" "$TARGET_AUTH"
echo "$success_msg"
codex
