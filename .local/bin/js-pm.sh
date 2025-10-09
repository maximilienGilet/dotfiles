#!/usr/bin/env bash
#
# JS runtime/package-manager helpers for Bash:
#   ni  → install (or add when args are given)
#   nr  → run package.json scripts
#   nxp → run binaries (cross-PM replacement for npx / dlx / bunx)
#   nn  → run arbitrary PM commands (npm/pnpm/yarn/bun)
#   pm  → print detected package manager
#
# Detection order: JS_PM env override > lockfiles > NPM_CONFIG_USER_AGENT > installed binaries

# --- internals ----------------------------------------------------------------

# Find nearest project root containing package.json
_js_find_project_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/package.json" ]]; then
      printf '%s\n' "$dir"
      return 0
    fi
    dir="$(dirname "$dir")"
  done
  printf '%s\n' "$PWD" # fallback
}

# Detect package manager
_js_detect_pm() {
  # explicit override
  if [[ -n "$JS_PM" ]]; then
    printf '%s\n' "$JS_PM"
    return 0
  fi

  local root="$(_js_find_project_root)"

  # Lockfiles
  if [[ -f "$root/yarn.lock" ]]; then
    printf '%s\n' "yarn"
    return 0
  fi
  if [[ -f "$root/pnpm-lock.yaml" ]]; then
    printf '%s\n' "pnpm"
    return 0
  fi
  if [[ -f "$root/bun.lockb" ]]; then
    printf '%s\n' "bun"
    return 0
  fi
  if [[ -f "$root/package-lock.json" ]]; then
    printf '%s\n' "npm"
    return 0
  fi

  # Env hint
  if [[ -n "$NPM_CONFIG_USER_AGENT" ]]; then
    case "$NPM_CONFIG_USER_AGENT" in
    yarn*)
      printf '%s\n' "yarn"
      return 0
      ;;
    pnpm*)
      printf '%s\n' "pnpm"
      return 0
      ;;
    bun*)
      printf '%s\n' "bun"
      return 0
      ;;
    npm*)
      printf '%s\n' "npm"
      return 0
      ;;
    esac
  fi

  # Fallback by availability
  for pm in pnpm yarn bun npm; do
    if command -v "$pm" >/dev/null 2>&1; then
      printf '%s\n' "$pm"
      return 0
    fi
  done

  printf '%s\n' "npm"
}

# Print detected package manager
pm() { _js_detect_pm; }

# --- public commands -----------------------------------------------------------

# ni: install deps (no args) OR add packages (with args)
ni() {
  local pm="$(_js_detect_pm)"
  case "$pm" in
  yarn)
    if [[ "$#" -eq 0 ]]; then
      yarn install
    else
      yarn add "$@"
    fi
    ;;
  pnpm)
    if [[ "$#" -eq 0 ]]; then
      pnpm install
    else
      pnpm add "$@"
    fi
    ;;
  bun)
    if [[ "$#" -eq 0 ]]; then
      bun install
    else
      bun add "$@"
    fi
    ;;
  npm | *)
    npm install "$@"
    ;;
  esac
}

# nr: run a package.json script
# usage: nr <script> [-- <args...>]
nr() {
  if [[ "$#" -eq 0 ]]; then
    printf 'Usage: nr <script> [-- args...]\n' >&2
    return 1
  fi

  local pm="$(_js_detect_pm)"
  local script="$1"
  shift

  case "$pm" in
  yarn)
    yarn run "$script" "$@"
    ;;
  pnpm)
    pnpm run "$script" -- "$@"
    ;;
  bun)
    bun run "$script" -- "$@"
    ;;
  npm | *)
    npm run "$script" -- "$@"
    ;;
  esac
}

# nxp: portable npx / dlx / bunx
# usage: nxp <binary> [args...]
nxp() {
  if [[ "$#" -eq 0 ]]; then
    printf 'Usage: nxp <binary> [args...]\n' >&2
    return 1
  fi

  local pm="$(_js_detect_pm)"
  case "$pm" in
  yarn)
    yarn dlx "$@"
    ;;
  pnpm)
    pnpm dlx "$@"
    ;;
  bun)
    bunx "$@"
    ;;
  npm | *)
    npx "$@"
    ;;
  esac
}

# nn: run arbitrary PM command
# usage: nn <command> [args...]
nn() {
  if [[ "$#" -eq 0 ]]; then
    printf 'Usage: nn <command> [args...]\n' >&2
    return 1
  fi

  local pm="$(_js_detect_pm)"
  "$pm" "$@"
}

# Optional short aliases
# alias ni=ni
# alias nr=nr
# alias nxp=nxp
# alias nn=nn
# alias pm=pm
