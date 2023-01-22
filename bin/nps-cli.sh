#!/bin/bash
cat <<EOF
NNNNNNNN        NNNNNNNN PPPPPPPPPPPPPPPPP       SSSSSSSSSSSSSSS 
N:::::::N       N::::::N P::::::::::::::::P    SS:::::::::::::::S
N::::::::N      N::::::N P::::::PPPPPP:::::P  S:::::SSSSSS::::::S
N:::::::::N     N::::::N PP:::::P     P:::::P S:::::S     SSSSSSS
N::::::::::N    N::::::N   P::::P     P:::::P S:::::S            
N:::::::::::N   N::::::N   P::::P     P:::::P S:::::S            
N:::::::N::::N  N::::::N   P::::PPPPPP:::::P   S::::SSSS         
N::::::N N::::N N::::::N   P:::::::::::::PP     SS::::::SSSSS    
N::::::N  N::::N:::::::N   P::::PPPPPPPPP         SSS::::::::SS  
N::::::N   N:::::::::::N   P::::P                    SSSSSS::::S 
N::::::N    N::::::::::N   P::::P                         S:::::S
N::::::N     N:::::::::N   P::::P                         S:::::S
N::::::N      N::::::::N PP::::::PP           SSSSSSS     S:::::S
N::::::N       N:::::::N P::::::::P           S::::::SSSSSS:::::S
N::::::N        N::::::N P::::::::P           S:::::::::::::::SS 
NODE___N         N_____N PACKAGE_P            STARTER_________S

EOF

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
COMMAND=$1
OTHER_ARGS=${@:2}

case $COMMAND in
  new)
    $SCRIPT_DIR/new.sh $OTHER_ARGS
    ;;
  update)
    $SCRIPT_DIR/update.sh $OTHER_ARGS
    ;;
  *)
    echo "Usage: nps new my-project-name"
  ;;
esac