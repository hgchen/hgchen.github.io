#!/bin/bash
set -euo pipefail

bundle check || bundle install
jekyll_pid=
stop_jekyll() {
    if [[ -n "$jekyll_pid" ]]; then
        kill "$jekyll_pid" 2>/dev/null || true
        wait "$jekyll_pid" 2>/dev/null || true
    fi
}
trap stop_jekyll EXIT
trap 'exit 0' INT TERM

while true; do
    bundle exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload \
        --verbose --trace --force_polling --destination /tmp/_site &
    jekyll_pid=$!
    inotifywait -q -e modify,move_self,delete_self _config.yml
    stop_jekyll
    jekyll_pid=
done
