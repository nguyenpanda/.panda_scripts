# Command
LATEX = lualatex

# Constants
FILE = main
INDIR = 
OUTDIR = pdf
CLEAN_FILES = $(addprefix $(OUTDIR)/*, .aux .fdb_latexmk .fls .log .out .synctex.gz .dvi)
AUTO_CLEAR = 1
IS_VERBOSE = 1

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
$(error FILE variable is not set. Use 'make latex OUTDIR=<output_path> FILE=<filename: default = main>')
endif

ifeq ($(INDIR),)
$(error INDIR variable is not set. Use 'make latex OUTDIR=<output_path> FILE=<filename: default = main>')
endif

# MAIN

.PHONY: all help latex clean clear

help:	### Display help message
	@awk -F ':.*###' '$$0 ~ FS {printf "$(GREEN)%15s$(RESET)%s\n", $$1 ":", $$2}' \
		$(MAKEFILE_LIST) | grep -v '@awk' | sort

latex:	### Compile into PDF file `make latex FILE=<filename> OUTDIR=<output_path>` (default FILE=main, OUTDIR=./output)
	@echo "$(GREEN)Compiling $(YELLOW)tex/$(INDIR)/$(FILE).tex$(GREEN) into PDF at $(YELLOW)$(OUTDIR)$(RESET)"
	$(VERBOSE)mkdir -p $(OUTDIR)  # Create output directory if it doesn't exist
	$(VERBOSE)cd "tex/$(INDIR)" && $(LATEX) -output-directory="$(abspath $(OUTDIR))" "$(FILE).tex"
ifeq ($(AUTO_CLEAR), 1)
	$(VERBOSE)$(MAKE) clean FILE=$(FILE) OUTDIR=$(OUTDIR)
endif

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

all:	### Compile all *.tex files in $(INDIR) and output PDFs to $(OUTDIR)
	$(VERBOSE)mkdir -p $(OUTDIR)
	$(VERBOSE)for file in $(INDIR)/*.tex; do \
		filename=$$(basename "$$file" .tex); \
		echo "$(GREEN)Compiling $(YELLOW)$$file$(GREEN) into PDF at $(YELLOW)$(OUTDIR)$(RESET)"; \
		$(LATEX) -output-directory="$(OUTDIR)" "$$file"; \
		if [ $(AUTO_CLEAR) -eq 1 ]; then \
			$(MAKE) clean FILE=$$filename OUTDIR=$(OUTDIR); \
		fi; \
	done
