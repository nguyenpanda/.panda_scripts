##### User define arguments #####

PROJECT_DIR     	:= $(realpath $(CURDIR))
PROJECT_NAME		:= header
PROJECT_LIB_TYPE	:= static
VERSION				:= 1.2.3

SRC_DIR         	:= src
BUILD_DIR         	:= build
HEADER_DIR     		:= include lib
DEPENDENCIES_DIR	:= lib/share
DEPENDENCIES		:= nguyenpanda

MAIN_CPP_FILES  	:= main.cpp
TARGET_EXE      	:= main.exe
ARGS            	:=

COMPILER        	:= clang++
FLAGS           	:= -Wall -O3 -std=c++20

VERBOSE         	:= TRUE
OS 					:= $(shell uname)

############################################################################

OBJ_DIR				:= object
PROJECT_OUT_DIR		:= output
OBJ_DIR 			:= $(BUILD_DIR)/$(OBJ_DIR)
PROJECT_OUT_DIR		:= $(BUILD_DIR)/$(PROJECT_OUT_DIR)
PROJECT_LIB_FLAGS	:= -l$(PROJECT_NAME) -L./$(PROJECT_OUT_DIR)
HEADER_DIR_FLAGS 	:= $(filter-out -I./, $(addprefix -I./, $(HEADER_DIR)))
DEPEND_DIR_FLAGS 	:= $(filter-out -L./, $(addprefix -L./, $(DEPENDENCIES_DIR)))
DEPEND_LIBS_FLAGS 	:= $(filter-out -l, $(addprefix -l, $(DEPENDENCIES)))

TARGET_EXE			:= $(BUILD_DIR)/$(TARGET_EXE)

LINKER_FLAGS 		:= -Wl,-rpath,$(PROJECT_DIR)/
LINKER_FLAGS 		:= $(addprefix $(LINKER_FLAGS), $(DEPENDENCIES_DIR))

HIDE 				:= $(if $(VERBOSE),, @)
ifeq ($(OS),Windows)
    RM          := del /F /Q
    RMDIR       := rmdir /S /Q
    MKDIR       := mkdir
    ERRIGNORE   := 2>NUL || true
    SEP         := \\

	RESET           := ""
	RED             := ""
	GREEN           := ""
	YELLOW          := ""
	BLUE            := ""
	MAGENTA         := ""
	CYAN            := ""
else
    RM          := rm -f
    RMDIR       := rm -rf
    MKDIR       := mkdir -p
    ERRIGNORE   := 2>/dev/null
    SEP         := /

	RESET           := \033[0m
	RED             := \033[1;91m
	GREEN           := \033[1;92m
	YELLOW          := \033[1;93m
	BLUE            := \033[1;94m
	MAGENTA         := \033[1;95m
	CYAN            := \033[1;96m
endif

ifeq ($(PROJECT_LIB_TYPE), static)
	LIBRARY_FILE_NAME	:= lib$(PROJECT_NAME)-$(VERSION).a
	LIBRARY_FILES		:= $(PROJECT_OUT_DIR)/$(LIBRARY_FILE_NAME)
	ARCHIVES			:= ar
	LIBRARY_FLAGS 		:= rvs
else ifneq ($(filter dynamic shared, $(PROJECT_LIB_TYPE)),)
	MAJOR          		:= $(shell echo $(VERSION) | cut -d. -f1)
	MINOR          		:= $(shell echo $(VERSION) | cut -d. -f2)
	PATCH          		:= $(shell echo $(VERSION) | cut -d. -f3)
	LIBRARY_FILE_NAME	:= lib$(PROJECT_NAME).so
	LIBRARY_FILES   	:= $(PROJECT_OUT_DIR)/$(LIBRARY_FILE_NAME).$(VERSION)
	FLAGS				+= -fPIC
	LIBRARY_FLAGS 		:= -dynamiclib
else
	$(error Unknown library type: $(PROJECT_LIB_TYPE). Use 'static', 'shared' or 'dynamic')
endif

############################################################################

BUILD_COMMAND   	?= $(COMPILER) $(FLAGS) $(HEADER_DIR_FLAGS) $(DEPEND_LIBS_FLAGS) $(LIB_DIR_FLAGS) $(LINKER_FLAGS)

############################################################################

ALL_SOURCE_DIRS     := $(shell find $(SRC_DIR) -type d)
CPP_FILES       	:= $(foreach dir, $(ALL_SOURCE_DIRS), $(wildcard $(dir)/*.cpp))

OBJECT_DIRS     	:= $(patsubst $(SRC_DIR)%, $(OBJ_DIR)%, $(ALL_SOURCE_DIRS))
OBJ_FILES       	:= $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(CPP_FILES))

.PHONY: all init build generate_lib execute directories clean clear

all: build generate_lib execute

init:
	@echo "$(YELLOW)Meta information$(RESET)"

	@echo "\t$(GREEN)PROJECT_DIR$(RESET)				: $(PROJECT_DIR)"
	@echo "\t$(GREEN)PROJECT_NAME$(RESET)				: $(PROJECT_NAME)"
	@echo "\t$(GREEN)PROJECT_LIB_TYPE$(RESET)			: $(PROJECT_LIB_TYPE)"
	@echo "\t$(GREEN)VERSION$(RESET)					: $(VERSION)"
	@echo "\t$(GREEN)MAJOR.MINOR.PATCH$(RESET)			: $(MAJOR).$(MINOR).$(PATCH)"
	
	@echo "\t$(GREEN)SRC_DIR$(RESET)					: $(SRC_DIR)"
	@echo "\t$(GREEN)BUILD_DIR$(RESET)					: $(BUILD_DIR)"
	@echo "\t$(GREEN)HEADER_DIR$(RESET)					: $(HEADER_DIR)"
	@echo "\t$(GREEN)DEPENDENCIES_DIR$(RESET)			: $(DEPENDENCIES_DIR)"
	@echo "\t$(GREEN)DEPENDENCIES$(RESET)				: $(DEPENDENCIES)"
	
	@echo "\t$(GREEN)MAIN_CPP_FILES$(RESET)				: $(MAIN_CPP_FILES)"
	@echo "\t$(GREEN)TARGET_EXE$(RESET)					: $(TARGET_EXE)"
	@echo "\t$(GREEN)ARGS$(RESET)						: $(ARGS)"
	
	@echo "\t$(GREEN)COMPILER$(RESET)					: $(COMPILER)"
	@echo "\t$(GREEN)FLAGS$(RESET)						: $(FLAGS)"
	
	@echo "\t$(GREEN)VERBOSE$(RESET)					: $(VERBOSE)"
	@echo "\t$(GREEN)OS$(RESET)							: $(OS)"
	
	@echo "\t$(GREEN)------------------------------------------$(RESET)"

	@echo "\t$(GREEN)LIBRARY_FILES$(RESET)				: $(LIBRARY_FILES)"
	@echo "\t$(GREEN)ARCHIVES$(RESET)					: $(ARCHIVES)"
	@echo "\t$(GREEN)LIBRARY_FLAGS$(RESET)				: $(LIBRARY_FLAGS)"

	@echo "\t$(GREEN)OBJ_DIR$(RESET)					: $(OBJ_DIR)"
	@echo "\t$(GREEN)PROJECT_OUT_DIR$(RESET)			: $(PROJECT_OUT_DIR)"
	@echo "\t$(GREEN)OBJ_DIR$(RESET)					: $(OBJ_DIR)"
	@echo "\t$(GREEN)PROJECT_OUT_DIR$(RESET)			: $(PROJECT_OUT_DIR)"
	@echo "\t$(GREEN)PROJECT_LIB_FLAGS$(RESET)			: $(PROJECT_LIB_FLAGS)"
	@echo "\t$(GREEN)HEADER_DIR_FLAGS$(RESET)			: $(HEADER_DIR_FLAGS)"
	@echo "\t$(GREEN)DEPEND_DIR_FLAGS$(RESET)			: $(DEPEND_DIR_FLAGS)"
	@echo "\t$(GREEN)DEPEND_LIBS_FLAGS$(RESET)			: $(DEPEND_LIBS_FLAGS)"

	@echo "\t$(GREEN)TARGET_EXE$(RESET)					: $(TARGET_EXE)"
	@echo "\t$(GREEN)LINKER_FLAGS$(RESET)				: $(LINKER_FLAGS)"

	@echo "\t$(GREEN)------------------------------------------$(RESET)"

	@echo "\t$(GREEN)BUILD_COMMAND$(RESET)				: $(BUILD_COMMAND)"
	
	@echo "\t$(GREEN)------------------------------------------$(RESET)"

	@echo "\t$(GREEN)ALL_SOURCE_DIRS$(RESET)			: $(ALL_SOURCE_DIRS)"
	@echo "\t$(GREEN)CPP_FILES$(RESET)					: $(CPP_FILES)"
	
	@echo "\t$(GREEN)OBJECT_DIRS$(RESET)				: $(OBJECT_DIRS)"
	@echo "\t$(GREEN)OBJ_FILES$(RESET)					: $(OBJ_FILES)"

	@echo "\t$(GREEN)------------------------------------------$(RESET)"

build: init directories $(OBJ_FILES) $(LIBRARY_FILES)
	@echo "\t$(GREEN)Build Complete$(RESET)"

generate_lib: $(LIBRARY_FILES)
	@echo "\t$(GREEN)$(PROJECT_LIB_TYPE) library $(MAGENTA)$(LIBRARY_FILES)$(GREEN) generated successfully!$(RESET)"

execute: build $(LIBRARY_FILES) $(TARGET_EXE)
	@echo "$(CYAN)---------------------------------------------------$(RESET)"
	@echo "Running $(MAGENTA)$(TARGET_EXE)$(RESET) with arguments: $(MAGENTA)$(ARGS)$(RESET)"
	@echo "$(CYAN)---------------------------------------------------$(RESET)"
	$(HIDE)./$(TARGET_EXE) $(ARGS)

directories:
	$(eval _DIRS := $(OBJECT_DIRS) $(PROJECT_OUT_DIR))
	@echo "$(YELLOW)Creating directories $(MAGENTA)$(_DIRS)$(RESET)"
	$(HIDE)$(MKDIR) $(_DIRS)
	@echo "$(GREEN)Creating directories successfully complete!$(RESET)"

clean:
	@echo "$(RED)Cleaning up build artifacts$(RESET)"
	$(HIDE)$(RMDIR) $(BUILD_DIR) $(PROJECT_OUT_DIR)

clear: clean

$(TARGET_EXE): $(LIBRARY_FILES) $(MAIN_CPP_FILES)
	@echo "$(YELLOW)Creating target $(MAGENTA)$(TARGET_EXE)$(YELLOW) using $(MAGENTA)$(LIBRARY_FILES)$(YELLOW) library$(RESET)"
	$(HIDE)$(BUILD_COMMAND) $(MAIN_CPP_FILES) -o $(TARGET_EXE) $(PROJECT_LIB_FLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo " \t- $(BLUE)$(MAGENTA)$<$(RESET) -> $(MAGENTA)$@$(RESET)"
	$(HIDE)$(BUILD_COMMAND) -c $< -o $@

$(LIBRARY_FILES): $(OBJ_FILES)
	@echo "$(BLUE)Creating $(PROJECT_LIB_TYPE) library $(MAGENTA)$(LIBRARY_FILES)$(RESET) from $(MAGENTA)$(OBJ_FILES)$(RESET)"
ifeq ($(PROJECT_LIB_TYPE), dynamic)
	$(HIDE)$(BUILD_COMMAND) $(LIBRARY_FLAGS) $(OBJ_FILES) -o $(LIBRARY_FILES)
	ln -sf $(LIBRARY_FILE_NAME).$(VERSION) $(PROJECT_OUT_DIR)/$(LIBRARY_FILE_NAME).$(MAJOR)
	ln -sf $(LIBRARY_FILE_NAME).$(MAJOR)  $(PROJECT_OUT_DIR)/$(LIBRARY_FILE_NAME)
else
	$(HIDE)$(ARCHIVES) $(LIBRARY_FLAGS) $(LIBRARY_FILES) $(OBJ_FILES)
	ln -sf $(LIBRARY_FILE_NAME) $(PROJECT_OUT_DIR)/lib$(PROJECT_NAME).a
endif
