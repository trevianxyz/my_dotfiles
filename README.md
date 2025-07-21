# 🛠️ MJS Dotfiles

A minimal, modern, and portable shell environment for serious development workflows. Designed for speed, clarity, and reproducibility across macOS machines.

---

## 🔧 Features

- **Zsh** with Oh My Zsh + curated plugin set
- **Starship** prompt (fast, context-aware)
- **Zellij** for terminal multiplexing
- **Direnv** for secure per-project environment injection
- **fzf** + **autojump** for fuzzy nav and movement
- **pyenv**, **nvm**, **cargo** toolchains
- **Atuin** for searchable, encrypted shell history
- Optional: **Nix** support (shell bootstrap, `nix-shell` fallback)

---

## 📁 Included


Here’s a production-grade README.md for your dotfiles repo. It’s tailored to your setup: Zsh, Zellij, Starship, Direnv, and optional fzf, atuin, and Nix support.

⸻

📄 ~/dotfiles/README.md

# 🛠️ MJS Dotfiles

A minimal, modern, and portable shell environment for serious development workflows. Designed for speed, clarity, and reproducibility across macOS machines.

---

## 🔧 Features

- **Zsh** with Oh My Zsh + curated plugin set
- **Starship** prompt (fast, context-aware)
- **Zellij** for terminal multiplexing
- **Direnv** for secure per-project environment injection
- **fzf** + **autojump** for fuzzy nav and movement
- **pyenv**, **nvm**, **cargo** toolchains
- **Atuin** for searchable, encrypted shell history
- Optional: **Nix** support (shell bootstrap, `nix-shell` fallback)

---

## 📁 Included

dotfiles/
├── .zshrc                         # Primary shell config
├── .config/
│   └── zellij/
│       └── layouts/
│           └── view_vector.kdl   # Zellij layout: code view mode
├── install.sh                     # One-command bootstrap script

---

## 🚀 Quick Start (First-Time Setup)

### 1. Clone your repo

```bash
git clone https://github.com/<your-username>/dotfiles ~/dotfiles
cd ~/dotfiles

2. Run the bootstrap script

./install.sh

This will:
	•	Install Homebrew (if needed)
	•	Install CLI tools: Zsh, Zellij, Starship, fzf, direnv, atuin, etc.
	•	Link your .zshrc and Zellij layout
	•	Initialize plugins and config

⸻

🧠 Key Plugins
	•	zsh-autosuggestions
	•	zsh-syntax-highlighting
	•	direnv
	•	starship
	•	zellij
	•	atuin
	•	fzf

⸻

🧪 Requirements
	•	macOS with Homebrew
	•	Zsh as your default shell (chsh -s /bin/zsh if not)

Optional:
	•	Oh My Zsh (installed via script if missing)
	•	SSH keys set up for GitHub access

⸻

🔄 Sync & Reuse Across Machines

git clone https://github.com/<your-username>/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh


⸻

🛡️ Security
	•	~/.secrets is loaded if present (ignored by Git)
	•	.env.local files loaded per project (git-aware)
	•	Zshrc is chmod 600 by default

⸻

📎 Notes
	•	Zellij auto-attaches on shell launch (if not already running)
	•	Layout view_vector.kdl can be customized per workflow
	•	Supports nvim, hx, or other editors
	•	LSP environment variables defined but unused unless consumed externally

⸻

📬 License


---
