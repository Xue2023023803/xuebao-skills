#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage:
  bash scripts/install_to_codex.sh [--target DIR] [--only SKILL_NAME]
  bash scripts/install_to_codex.sh --list
  bash scripts/install_to_codex.sh --help

Options:
  --target DIR       Install into DIR instead of ~/.codex/skills
  --only NAME        Install only one skill
  --list             List available skills and exit
  --help             Show this help text
USAGE
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/skills"
TARGET_DIR="${HOME}/.codex/skills"
ONLY_SKILL=""
LIST_ONLY=0

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      [[ $# -ge 2 ]] || { echo "Missing value for --target" >&2; exit 1; }
      TARGET_DIR="$2"
      shift 2
      ;;
    --only)
      [[ $# -ge 2 ]] || { echo "Missing value for --only" >&2; exit 1; }
      ONLY_SKILL="$2"
      shift 2
      ;;
    --list)
      LIST_ONLY=1
      shift
      ;;
    --help|-h)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

[[ -d "${SOURCE_DIR}" ]] || { echo "Missing skills directory: ${SOURCE_DIR}" >&2; exit 1; }

mapfile -t AVAILABLE_SKILLS < <(find "${SOURCE_DIR}" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)

if [[ ${LIST_ONLY} -eq 1 ]]; then
  printf '%s\n' "${AVAILABLE_SKILLS[@]}"
  exit 0
fi

mkdir -p "${TARGET_DIR}"

install_one() {
  local skill_name="$1"
  local src="${SOURCE_DIR}/${skill_name}"
  local dst="${TARGET_DIR}/${skill_name}"

  [[ -f "${src}/SKILL.md" ]] || { echo "Skipping ${skill_name}: missing SKILL.md" >&2; return 1; }

  rm -rf "${dst}"
  cp -R "${src}" "${dst}"
  echo "Installed ${skill_name} -> ${dst}"
}

installed_count=0
if [[ -n "${ONLY_SKILL}" ]]; then
  if [[ ! -d "${SOURCE_DIR}/${ONLY_SKILL}" ]]; then
    echo "Skill not found: ${ONLY_SKILL}" >&2
    echo "Available skills:" >&2
    printf '  %s\n' "${AVAILABLE_SKILLS[@]}" >&2
    exit 1
  fi
  install_one "${ONLY_SKILL}"
  installed_count=1
else
  for skill_name in "${AVAILABLE_SKILLS[@]}"; do
    install_one "${skill_name}"
    installed_count=$((installed_count + 1))
  done
fi

echo "Installed ${installed_count} skill(s) into ${TARGET_DIR}"
