#!/usr/bin/env bash
set -euo pipefail

url=$(git config --get remote.origin.url)

case "$url" in
  git@*)
    # git@host:owner/repo(.git) -> https://host/owner/repo
    url=${url#git@}
    url=${url/:/\/}
    url=https://${url%.git}
    ;;
  ssh://*)
    # ssh://git@host/owner/repo(.git) -> https://host/owner/repo
    url=${url#ssh://git@}
    url=https://${url%.git}
    ;;
  https://*|http://*)
    url=${url%.git}
    ;;
  *)
    echo "git-open: unrecognized remote URL: $url" >&2
    exit 1
    ;;
esac

if command -v xdg-open >/dev/null; then
  exec xdg-open "$url"
else
  exec open "$url"
fi
