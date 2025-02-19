# Dotfiles Setup

This repository contains my personal dotfiles for various shell configurations. Follow the instructions below to set up the environment on your system.

## Prerequisites

Before starting, ensure you have `stow` and `git` installed on your system. If not, you can install them using:

```bash
sudo apt update
sudo apt install stow git
```

## Setup Instructions

1. **Clone the repository:**

   First, clone the repository to your local machine.

   ```bash
   git clone https://github.com/dinesh-kanth-98/dotfiles.git
   ```

2. **Navigate to the `dotfiles` directory:**

   ```bash
   cd dotfiles
   ```

3. **Stow the dotfiles:**

   Use the `stow` command to symlink the configurations to the appropriate directories.

   For Zsh configuration:

   ```bash
   mkdir -p ~/.config/zsh/
   stow -t ~/.config/zsh/ zsh
   ```

   For Bash configuration:

   ```bash
   stow -t ~/ bash
   ```

   For Alacritty configuration:

   ```bash
   mkdir -p ~/.config/alacritty/
   stow -t ~/.config/alacritty/ alacritty
   ```

   For Zellij configuration:

   ```bash
   mkdir -p ~/.config/zellij
   stow -t ~/.config/zellij/ zellij
   ```

   For bat configuration:

   ```bash
   mkdir -p ~/.config/bat
   stow -t ~/.config/bat/ bat

   ```

4. **Enjoy your new configuration!**

Let me know if you need anything else!
