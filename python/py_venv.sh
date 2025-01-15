#! /bin/bash

py_venv() {
    GREEN="\033[1;92m"
    YELLOW="\033[1;93m"
    RESET="\033[0m"

    HELP_MESSAGE="Usage: py_venv
    Option:
        -h --h --help           : Print help
        -v <uint>               : Set python version (default \`11\`)
        -n <str>                : Set virtual environment's name (default \`.venv\`)
        -f <str>                : Set dependency packages file (default \`requirements.txt\`)
    "

    python_version="python3.11"
    venv_name=".venv"
	venv_package="venv"
	requirements_file="requirements.txt"

    for arg in "$@"; do
        case $arg in
            -h|--h|--help)
                echo -e $HELP_MESSAGE
                return 0;;
        esac
    done
	
    while getopts "v:n:f:h" opt; do
        case $opt in
            v) 
				if ! [[ $OPTARG =~ ^[0-9]+$ ]]; then
					echo -e "Error: \`python_version\` must be an integer."
					echo -e $HELP_MESSAGE
					return 1
				fi
				python_version="python3.$OPTARG";;
            n) 
				venv_name=$OPTARG;;
			f)
				requirements_file=$OPTARG;;
            *) 
                echo -e "Unknown option: $opt"
                echo -e $HELP_MESSAGE
                return 1;;
        esac
    done

	requirements_path="$PWD/$requirements_file"
	
	echo -e "Creating virtual environment with ${GREEN}${python_version}${RESET} & ${GREEN}${venv_package}${RESET}. Venv's name is ${GREEN}${venv_name}${RESET}..."
    if ! command -v $python_version &> /dev/null; then
        echo -e "Error: $python_version is not installed or not in your PATH."
        return 1
    fi

    $python_version -m $venv_package "${venv_name}"
    if [ $? -ne 0 ]; then
        echo -e "Error: Failed to create the virtual environment."
        return 1
    fi

    echo -e "Activating virtual environment ${GREEN}${venv_name}${RESET}..."
    source "${venv_name}/bin/activate"
    if [ $? -ne 0 ]; then
        echo -e "Error: Failed to activate the virtual environment."
        return 1
    fi

    if [ -f $requirements_path ]; then
        echo -e "Installing dependencies from ${GREEN}${requirements_path}${RESET}..."
        pip install -r $requirements_path
        if [ $? -ne 0 ]; then
            echo -e "Error: Failed to install dependencies."
            return 1
        fi
    else
        echo -e "${YELLOW}Warning: ${GREEN}$requirements_path${RESET} not found. Skipping dependency installation.${RESET}"
    fi

    echo -e "Virtual environment ${GREEN}${venv_name}${RESET} created and activated successfully!"

    return 0
}
