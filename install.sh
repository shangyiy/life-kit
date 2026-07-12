#!/usr/bin/env bash
# Install life-kit skills into agent harness skill directories.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$ROOT/skills"

usage() {
  cat <<EOF
Usage: $(basename "$0") <harness>

Harnesses:
  cursor   -> ~/.cursor/skills/<skill>
  grok     -> ~/.grok/skills/<skill>
  agents   -> ~/.agents/skills/<skill>
  claude   -> ~/.claude/skills/<skill>
  codex    -> ~/.codex/skills/<skill>
  project  -> ./.agents/skills and ./.cursor/skills (repo cwd)
  all      -> user-level cursor, grok, agents, claude, codex

Grok plugin (separate): grok plugin install shangyiy/life-kit --trust
EOF
}

install_skill() {
  local dest_root="$1"
  local name="$2"
  local src="$SKILLS_DIR/$name"
  local dest="$dest_root/$name"
  if [[ ! -d "$src" ]]; then
    echo "missing skill: $src" >&2
    exit 1
  fi
  mkdir -p "$(dirname "$dest")"
  rm -rf "$dest"
  cp -R "$src" "$dest"
  echo "installed -> $dest"
}

install_all_skills() {
  local dest_root="$1"
  for skill in "$SKILLS_DIR"/*; do
    [[ -d "$skill" ]] || continue
    install_skill "$dest_root" "$(basename "$skill")"
  done
}

case "${1:-}" in
  cursor)  install_all_skills "$HOME/.cursor/skills" ;;
  grok)    install_all_skills "$HOME/.grok/skills" ;;
  agents)  install_all_skills "$HOME/.agents/skills" ;;
  claude)  install_all_skills "$HOME/.claude/skills" ;;
  codex)   install_all_skills "$HOME/.codex/skills" ;;
  project)
    install_all_skills "$(pwd)/.agents/skills"
    install_all_skills "$(pwd)/.cursor/skills"
    ;;
  all)
    install_all_skills "$HOME/.cursor/skills"
    install_all_skills "$HOME/.grok/skills"
    install_all_skills "$HOME/.agents/skills"
    install_all_skills "$HOME/.claude/skills"
    install_all_skills "$HOME/.codex/skills"
    ;;
  -h|--help|help|"")
    usage
    exit 0
    ;;
  *)
    echo "Unknown harness: $1" >&2
    usage
    exit 1
    ;;
esac
