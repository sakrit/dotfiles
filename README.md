---

## **🛠️ My Dotfiles**

This repository contains my personal dotfiles and configuration settings for various tools and applications. These files help set up my development environment quickly on a new system.

### **📁 Included Configurations**
- 🖥️ **Shell**: `.zshrc`, `tmux`
- 🎨 **Editor Configs**: `.config/nvim/init.lua`
- 🖼️ **Terminal & UI**: `.tmux.conf`, `.Xresources`, `.config/alacritty/alacritty.toml`
- 🌐 **Git**: `.gitconfig`,
- 🚀 **Others**: Add any other relevant dotfiles
---

### **📦 Installation**
To install these dotfiles on a new system, follow these steps:

#### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/sakrit/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

#### **2️⃣ Create Symbolic Links (Symlinks)**
To avoid copying files manually, create symlinks:
```sh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
```
Modify these based on your setup.

#### **3️⃣ Reload Your Shell**
```sh
source ~/.zshrc
```

---

### **🔄 Updating**
To update your dotfiles repository and apply changes:
```sh
cd ~/.dotfiles
git pull origin main
```

---

### **📌 Notes**
- Keep your sensitive files (`.ssh/config`, `.env`) private by adding them to `.gitignore`.
- If using **stow**, you can manage dotfiles easily:
  ```sh
  stow i3 nvim git
  ```

---
