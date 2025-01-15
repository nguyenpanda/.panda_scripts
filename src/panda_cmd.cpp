#include <filesystem>
#include <iostream>
#include <vector>
#include <string>
#include <cstring>

namespace fs = std::filesystem;

fs::path current_directory = fs::current_path();
std::vector<fs::path> shell_files;
std::string file_extension = ".sh";
bool print_full_path = false;

const char* PROGRAM_NAME = "panda_cmd";

void print_help() {
    std::cout 
        << "Usage: " << PROGRAM_NAME << " [options]\n"
              << "Options:\n"
              << "  -h, --h, --help         Print this help message\n"
              << "  --p, --path             Print full file paths\n"
              << "  -at <destination>       Set the target directory\n"
              << "  -e <.extension>         Set the file extension to search for\n";
}

int main(int argc, char* argv[]) {

    for (int i = 1; i < argc; ++i) {

        char* option = argv[i];

        if (strcmp(option, "--p") == 0 or strcmp(option, "--path") == 0) {
            print_full_path = true;
        } else if (strcmp(option, "-at") == 0) {
            if (++i >= argc) {
                std::cerr << "Error: Missing <destination> after -at.\n"
                          << "Run `" << PROGRAM_NAME << " --help` for more information.\n";
                return 1;
            }

            std::string new_dir = argv[i];
            if (new_dir == ".") continue;
			
            current_directory = fs::path(new_dir);
        } else if (strcmp(option, "-e") == 0) {
            if (++i >= argc) {
                std::cerr << "Error: Missing <extension> after -e.\n"
                          << "Run `" << PROGRAM_NAME << " --help` for more information.\n";
                return 1;
            }

            file_extension = argv[i];
            if (file_extension[0] != '.') {
                std::cerr << "Error: Missing `.` at the beginning of <extension>. Got `" << file_extension << "`.\n"
                          << "Run `" << PROGRAM_NAME << " --help` for more information.\n";
                return 1;
            }
        } else if (
			strcmp(option, "-h") == 0 or 
			strcmp(option, "--h") == 0 or 
			strcmp(option, "--help") == 0) {
            print_help();
            return 0;
        } else {
            std::cerr << "Error: Unknown option `" << option << "`.\n"
                      << "Run `" << PROGRAM_NAME << " --help` for more information.\n";
            return 1;
        }
    }

    try {
        for (const auto& entry : fs::recursive_directory_iterator(current_directory)) {
            std::string ext = entry.path().extension();
            if (entry.is_regular_file() and 
			    (ext == file_extension or ext == ".exe")
			) shell_files.push_back(entry.path());
        }
    } catch (const fs::filesystem_error& e) {
        std::cerr << "Filesystem error: " << e.what() << '\n';
        return 1;
    }

    if (shell_files.empty()) {
        std::cout << "No files with extension `" << file_extension << "` found in " << current_directory << ".\n";
    } else {
        for (const auto& file : shell_files) {
            if (print_full_path) std::cout << file << '\n';
            else std::cout << file.filename() << '\n';
        }
    }

    return 0;
}
