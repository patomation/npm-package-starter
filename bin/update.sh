#!/bin/bash
cat <<EOF
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 U P D A T E
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
EOF

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR="$(dirname "$SCRIPT_DIR")"

copy(){
  cp -r $ROOT_DIR/$1 $PWD/$1
}

remove(){
  # Silent rm errors by piping error to null
  rm $@ 2> /dev/null
}

remove -r $PDW/.husky
cp -r $ROOT_DIR/.husky $PWD

# copy .commitlintrc.json
node $SCRIPT_DIR/modules/commitlintrc-updater.js $ROOT_DIR/.commitlintrc.json $PWD/.commitlintrc.json
remove $PWD/commitlint.config.json

copy .gitignore

copy .prettierignore
copy .prettierrc
remove $PWD/.eslintignore
remove $PWD/.eslintrc.js

copy LICENSE
copy tsconfig.json
copy tsconfig.test.json

node $SCRIPT_DIR/modules/package-updater.js $ROOT_DIR/package.json $PWD/package.json -r "$(git remote -v)"
remove -r $PWD/node_modules
remove $PWD/package-lock.json

