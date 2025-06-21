# 🐼 Panda Scripts

<!DOCTYPE html>
<html lang="en">
    <body>
        <img alt="nguyenpanda logo" src="docs/logo/nguyenpanda_black.png"/>
    </body>
</html>

A collection of scripts designed to streamline tasks and enhance productivity.

## How to install

### Clone the repository

```bash
git clone https://github.com/nguyenpanda/.panda_scripts.git
cd .panda_scripts
```

### Edit the `main.sh` file

Open the `main.sh` file in a text editor and update the `PANDA_SCRIPTS_DIR` variable to point to the directory where you cloned the repository:

```bash
source "path/to/.panda_scripts/main.sh"
```

Replace `path/to/.panda_scripts` with the full path to your `.panda_scripts` directory.

### Set up environment variables

To ensure the environment variables and aliases are available every time you start a new shell session, add the following lines to your `~/.zshrc`, `~/.bashrc` or `~/.bash_profile` file:

```bash
source "path/to/.panda_scripts/main.sh"
```

Again, replace `path/to/.panda_scripts` with the correct path to the `.panda_scripts` directory.

### Apply the Changes

After modifying your shell configuration file, apply the changes to your current shell session. You can do this by either restarting your terminal or running the appropriate command

For Zsh:

```bash
source `~/.zshrc`
```

For Bash:

```bash
source `~/.bashrc`
```

For Bash Profile:

```bash
source `~/.bash_profile`
```

## 🚀 How to Build

To build the `.cpp` files located in the `src` directory, use the following command. The build process utilizes `clang++` with `C++20` standards:

```bash
make all
```

## 🛠️ How to Use

### 🐼 Panda Command

The `panda_cmd` command lists all files with `.sh` and `.exe` extensions. Use the following command to explore its features:

```zsh
panda_cmd --help
```

### 📂 Cloning Templates

The tmpl command (short for template) clones templates into the current directory. To learn more, run:

```zsh
tmpl --help
```

## License

This project is licensed under the Apache 2.0 Software License. See the LICENSE file for details.

## Contact 📧

Author: **nguyenpanda**

📧 [hatuongnguyen0107@gmail.com](hatuongnguyen0107@gmail.com)

📧 [nguyen.hatuong0107@hcmut.edu.vn](nguyen.hatuong0107@hcmut.edu.vn)
