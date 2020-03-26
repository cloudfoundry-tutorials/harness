#! /bin/bash

: "${TUTORIAL:?TUTORIAL env var must specify name of sibling directory, eg 'trycf'}"

set -euo pipefail

which fswatch
mkdir -p themes

SRC_CONFIG_PATH=../tutorials/ci/tutorial/hugo-config.yml
SRC_THEME_PATH=../hugo-whisper-theme
SRC_CONTENT_PATH=../${TUTORIAL}/content

trap "exit" INT

(sleep 2 && hugo serve -D) &

while true; do
  rsync -arvz --delete-before ${SRC_CONTENT_PATH} .
  rsync -arvz --delete-before ${SRC_THEME_PATH} themes/
  rsync -rv --delete-before ${SRC_CONFIG_PATH} config.yml

  fswatch --one-event \
    ${SRC_THEME_PATH} \
    ${SRC_CONFIG_PATH} \
    ${SRC_CONTENT_PATH}
done
