# Command
LATEX = lualatex

# Constants
FILE = main
INDIR = 01
OUTDIR = pdf
CLEAN_FILES = $(addprefix $(OUTDIR)/*, .aux .fdb_latexmk .fls .log .out .synctex.gz .dvi)
AUTO_CLEAR = 1
IS_VERBOSE = 0

ifeq ($(IS_VERBOSE), 0)
	VERBOSE = @
endif

# Color
RED = \033[1;91m
GREEN = \033[1;92m
YELLOW = \033[1;93m
RESET = \033[0m

# Pre-check
ifeq ($(FILE),)
$(error FILE variable is not set. Use 'make latex INDIR=<input_path: default = 01> FILE=<filename: default = main>')
endif

ifeq ($(INDIR),)
$(error INDIR variable is not set. Use 'make latex INDIR=<input_path: default = 01> FILE=<filename: default = main>')
endif

# MAIN

.PHONY: all help latex clean clear

CMD_FORMAT = \`make late INDIR=<input_path> FILE=<filename> OUTDIR=<output_path>\` (default FILE=main, INDIR=01, OUTDIR=pdf)
NOTE_MSG = Setting \`INDIR=01\` and \`FILE=main\` means the file \`tex/01/main.tex\` will be compiled into \`main.pdf\`, which is saved in the \`pdf\` directory.
OTHER_CMD_MSG = This Makefile-based LaTeX compiler also supports several basic commands using the syntax \`make <other_command>\`.
HELP_MSG = "$(GREEN)Command format:$(RESET)\n\n\t$(CMD_FORMAT)\n\n$(GREEN)Note: $(RESET)$(NOTE_MSG)\n\n$(OTHER_CMD_MSG)\n$(GREEN)Supported commands include:$(RESET)"

help:	### Display help message
	@echo $(HELP_MSG)
	@awk -F ':.*###' '$$0 ~ FS {printf "$(GREEN)%15s$(RESET)%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk' | sort

latex:	### Compile into PDF file `make latex FILE=<filename> INDIR=<input_path>` (default FILE=main, INDIR=01)
	@echo "$(GREEN)Compiling $(YELLOW)tex/$(INDIR)/$(FILE).tex$(GREEN) into PDF at $(YELLOW)$(OUTDIR)$(RESET)"
	$(VERBOSE)mkdir -p $(OUTDIR)  # Create output directory if it doesn't exist
	$(VERBOSE)cd "tex/$(INDIR)" && $(LATEX) -output-directory="$(abspath $(OUTDIR))" "$(FILE).tex"
ifeq ($(AUTO_CLEAR), 1)
	$(VERBOSE)$(MAKE) clean FILE=$(FILE) OUTDIR=$(OUTDIR)
endif
	@echo "$(YELLOW)Recompile LaTex using \`make latex\` to ensure the table of contents and other references appear correctly in the PDF.$(RESET)"

clean:	### Clean target to delete unnecessary files `make clean FILE=<filename> OUTDIR=<output_path>`
	@echo "$(GREEN)Cleaning unnecessary files for $(FILE)...$(RESET)"
ifeq ($(OS),Windows_NT)
	$(VERBOSE)del /Q $(CLEAN_FILES) 2>nul || echo No unnecessary files found
	@echo $(GREEN)Unnecessary files for $(FILE) deleted from $(OUTDIR).$(RESET)
else
	$(VERBOSE)rm -f $(CLEAN_FILES)
	@echo "$(GREEN)Unnecessary files for $(FILE) deleted from $(OUTDIR).$(RESET)"
endif

clear: clean ### Clear unnecessary files using `make clear FILE=<filename> OUTDIR=<output_path>`
