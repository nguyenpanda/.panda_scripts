export PANDA_SCRIPTS_DIR="$HOME/.panda_scripts"
export PANDA_TMPL_DIR="${PANDA_SCRIPTS_DIR}/templates"

source "${PANDA_SCRIPTS_DIR}/python/py_venv.sh"
source "${PANDA_TMPL_DIR}/tmpl.sh"

alias panda_cmd="${PANDA_SCRIPTS_DIR}/bin/panda_cmd.exe"
