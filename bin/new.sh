#!/bin/bash
cat <<EOF
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 N E W
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
EOF

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

NAME=$1
if [ -z "$NAME" ]
then
  echo "Usage: nps new name-of-project"
  exit  0
fi



echo "$ROOT_DIR/bin"
mkdir $PWD/$NAME
rsync -av \
  --exclude=.git \
  --exclude=bin \
  --exclude=build \
  --exclude=node_modules \
  --exclude=CHANGELOG.md \
  --exclude=temp \
  $ROOT_DIR/ \
  $PWD/$NAME/

cd $PWD/$NAME
git init
git add .
git commit -m "chore: new template generated from https://github.com/patomation/npm-package-starter"

