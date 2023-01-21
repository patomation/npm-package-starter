#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

echo "$ROOT_DIR"
echo "current"
echo "$PWD"

copy(){
  cp -r $ROOT_DIR/$1 $PWD/$1
}

copy .husky

copy .commitlintrc.json
rm $PWD/commitlint.config.json

copy .gitignore

copy .prettierignore
copy .prettierrc
rm $PWD/.eslintignore
rm $PWD/.eslintrc.js

copy LICENSE
copy tsconfig.json
copy tsconfig.test.json

node $SCRIPT_DIR/modules/package-updater.js $ROOT_DIR/package.json $PWD/package.json
rm -r $PWD/node_modules
rm $PWD/package-lock.json