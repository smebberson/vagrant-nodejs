
if [[ -z $BASHURATOR_DIR ]]; then
    BASHURATOR_DIR="$(dirname "${BASH_SOURCE[0]}")"
fi

# Functions.
source "$BASHURATOR_DIR/functions/configure.sh"
source "$BASHURATOR_DIR/functions/init.sh"

# Run the init function.
bashurator.init
