#!/bin/bash
set -ex

case "$TTYLESS" in
  ACCEPT)
    cat <<EOF > "/etc/sudoers.d/$(whoami)"
Defaults:$(whoami) !requiretty
EOF
    chmod 0440 /etc/sudoers.d/$(whoami)
    ;;
  *)
    rm -f /etc/sudoers.d/$(whoami)
    ;;
esac

