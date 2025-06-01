#! /bin/bash

tmpl() {
	GREEN="\033[1;92m"
	YELLOW="\033[1;93m"
	RESET="\033[0m"

	CMD="tmpl"

	HELP_MESSAGE="\`tmpl\`, created by Ha Tuong Nguyen a.k.a nguyenpanda in 2025, is a command-line application that clones a \`template\` for a specific programming language.
    
Command format: \`$CMD <lang> <template_name>\`
Option:
    -h --h --help           : Print help
    --lang                  : List all supported language
    -d <str>                : Set the destination directory (default cwd=`$PWD`)
Note:
    To visit all available templates of a specific programming language, use this command (\`$CMD <lang> --list\`)
"

	dest_dir="$PWD"


    for arg in "$@"; do
        case "$arg" in
            -h|--h|--help)
                echo -e "$HELP_MESSAGE"
                return 0;;
            --lang)
                echo -e "Supported Languages:"
                find "$PANDA_TMPL_DIR" -type d -maxdepth 1 -mindepth 1 | sort | awk -F/ '{print "\t- \033[1;92m" $NF "\033[0m"}'
                return 0;;
        esac
    done

    if [[ $# -lt 2 ]]; then
        echo -e "${YELLOW}Error: Missing required arguments.${RESET}\n"
        echo -e "$HELP_MESSAGE"
        return 0
    fi

    lang="$1"
    template_name="$2"
    shift 2

    while [[ "$#" -gt 0 ]]; do
        case "$1" in
            -d)
                if [[ -z "$2" ]]; then
                    echo -e "${YELLOW}Error: Missing argument for -d (destination directory).${RESET}"
                    return 1
                fi
                dest_dir="$2"
                shift 2;;
            *)
                echo -e "${YELLOW}Unknown option: $1${RESET}\n"
                echo -e "$HELP_MESSAGE"
                return 1;;
        esac
    done

    lang_dir="${PANDA_TMPL_DIR}/${lang}"
    if [[ ! -d "$lang_dir" ]]; then
        echo -e "${YELLOW}Error: Language '$lang' is not supported or directory does not exist at '${lang_dir}'.${RESET}"
        return 1
    fi

    # Check if template exists
    tmpl_path="${lang_dir}/${template_name}"
    if [[ ! -d "$tmpl_path" ]]; then
        if [[ "${template_name}" == "--list" ]]; then
            echo -e "${GREEN}All \`${lang}\` templates.${RESET}"
            ls "${lang_dir}"
            return 0
        fi
        echo -e "${YELLOW}Error: Template '$template_name' does not exist in '${lang_dir}'.${RESET}"
        return 1
    fi

    # Check if destination directory exists
    if [[ ! -d "$dest_dir" ]]; then
        echo -e "${YELLOW}Error: Destination directory '$dest_dir' does not exist.${RESET}"
        return 1
    fi

    # Clone template to destination
    cp -R -n "$tmpl_path/"* "$dest_dir"
    echo -e "Files from ${GREEN}${tmpl_path}${RESET} copied to ${GREEN}${dest_dir}${RESET}"

    return 0
}
