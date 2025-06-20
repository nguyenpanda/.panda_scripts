COMPILER = clang++
module = cppmodule
MODULE_DIR = $(module)
ext	= cpp

SRC_DIR = $(MODULE_DIR)/src
INCLUDE_DIR = $(MODULE_DIR)/include

SRC_FILE = $(wildcard $(SRC_DIR)/*.$(ext))

CFLAGS = -std=c++23

VENV_DIR = .venv

PYTHON = $(VENV_DIR)/bin/python
PY_VERSION = 3.13
PY_FLAGS = $(shell python$(PY_VERSION)-config --cflags --ldflags)
PIP = $(VENV_DIR)/bin/pip

PY_UNITTEST_PACK = pytest
PY_TEST_DIR = tests
PY_TEST_REPORT = tests_report
PYTEST_HTML = pytest.html
PYTEST_FLAGS = --html=$(PY_TEST_REPORT)/$(PYTEST_HTML) -s --maxfail=5

RED		= \033[1;91m
GREEN 	= \033[1;92m
YELLOW 	= \033[1;93m
RESET 	= \033[0m
VERBOSE = 

.PHONY: debug_make
debug_make:
	@echo "$(GREEN)Running \`Makefile\` without any target will automatically run \`debug_make\` target$(RESET)"
	@echo "$(GREEN)Makefile's debug section$(RESET)"

.PHONY: _check_venv
_check_venv:
	@if [ ! -d $(VENV_DIR) ]; then \
		echo "$(GREEN)Creating Python$(PY_VERSION) virtual environment called $(YELLOW)$(VENV_DIR)$(RESET)"; \
		python$(PY_VERSION) -m venv $(VENV_DIR); \
		echo "$(GREEN)Installing dependencies from \`$(YELLOW)requirements.txt$(RESET)\`"; \
		$(PIP) install -U pip; \
		$(PIP) install -r requirements.txt; \
	fi

.PHONY: main.py
main.py: _check_venv
	@echo "$(GREEN)Running $(YELLOW)main.py$(GREEN) using $(YELLOW)$(PYTHON)$(RESET)"
	$(VERBOSE)$(PYTHON) main.py

.PHONY: main.cpp
main.cpp: _check_venv
	@echo "$(GREEN)Running $(YELLOW)main.cpp$(RESET)"
	$(VERBOSE)$(COMPILER) main.cpp -o main.exe \
		-I./$(INCLUDE_DIR) \
		$(shell python$(PY_VERSION)-config --includes --ldflags) \
		-lpython$(PY_VERSION) \

.PHONY: compile
compile: _check_venv
	@echo "$(GREEN)Building shared object$(RESET)"
	$(VERBOSE)$(COMPILER) $(SRC_FILE) -o $(module).so \
		-shared -fPIC \
		-I./$(INCLUDE_DIR) \
		$(CFLAGS) \
		$(PY_FLAGS) \
		-lpython$(PY_VERSION) \

.PHONY: build
build: _check_venv
	@echo "$(GREEN)Building module using setup.py$(RESET)"
	$(VERBOSE)$(PYTHON) setup.py build

.PHONY: tests
tests: _check_venv
	@echo "$(GREEN)Running unit test on \`$(PY_TEST_DIR)\` directory with \`$(PY_UNITTEST_PACK)\` package$(RESET)"
	$(VERBOSE)$(PYTHON) -m $(PY_UNITTEST_PACK) $(PY_TEST_DIR) $(PYTEST_FLAGS)

.PHONY: install
install: _check_venv
	@echo "$(GREEN)Installing $(YELLOW)$(module)$(GREEN) package into $(YELLOW)$(VENV_DIR)$(RESET)"
	$(VERBOSE)$(PIP) install .

.PHONY: clear
clear:
	rm -rf *.so
	rm -rf *.exe
	rm -rf *.egg-info
	rm -rf build
	rm -rf *.dSYM
	rm -rf $(PY_TEST_REPORT)

.PHONY: reset_venv
reset_venv: clear
	@if [ -d $(VENV_DIR) ]; then \
		$(PIP) uninstall $(module) -y; \
	fi
