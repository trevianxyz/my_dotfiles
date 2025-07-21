# ~/.zshrc — Clean, Modern Dev Setup for iTerm2, Starship, Direnv

# ==========
# 🏆 General Settings
# ==========
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# ==========
# 🔌 Plugins (Oh My Zsh)
# ==========
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting  # ← must be last
  direnv
  history
  python
  rust
  nvm
  uv
)

# Load OMZ (must happen before any plugin-dependent behavior)
source $ZSH/oh-my-zsh.sh

# ==========
# 🛣️ PATH Setup (Homebrew, local tools, pyenv, cargo, Node)
# ==========
typeset -U path
eval "$(/opt/homebrew/bin/brew shellenv)"

export PYENV_ROOT="$HOME/.pyenv"
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PYENV_ROOT/bin:$PATH"

# ==========
# 🐍 Python Setup (pyenv, LSPs)
# ==========
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv virtualenv-init -)"
fi
export PYENV_VERSION="3.12.2"
export PYTHON_LS=("ruff-lsp" "pyright-langserver" "robotframework_ls")

# ==========
# 🦀 Rust Setup
# ==========
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
export RUST_LS="rust-analyzer"

# ==========
# 📦 Node.js Setup (nvm, LSPs)
# ==========
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
export NODE_LS=(
  "typescript-language-server"
  "graphql-lsp"
  "docker-langserver"
  "docker-compose-langserver"
  "yaml-language-server"
)

# ==========
# ⚙️ Ansible / Protobuf / YAML LSPs
# ==========
export ANSIBLE_LS="ansible-language-server"
export PROTOBUF_LS="buf-ls"

# ==========
# 🚀 Starship Prompt
# ==========
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ==========
# 📜 Aliases
# ==========
alias vim='nvim'
alias code='hx .'
alias ll='ls -lah'

# Git Shortcuts
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gd='git diff'
alias gco='git checkout'
alias gcm='git commit -m'
alias gcb='git checkout -b'
alias gl='git log --oneline --graph --decorate'
alias gpo='git push origin'
alias gpl='git pull'
alias gst='git status -sb'
alias gundo='git reset --soft HEAD~1'
alias gclean='git clean -fd && git reset --hard'

# Config shortcuts
alias zshconfig='vim ~/.zshrc'
alias ohmyz='vim ~/.zshrc'

# Diagrams
alias kroki='curl -X POST https://kroki.io/graphviz/svg -d @-'
alias codeview="cd /your/project && zellij --layout view_vector"

# Autojump (optional)
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

# ==========
# 🌎 Local Environment Auto-Loader
# ==========

# Global secrets
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets" && chmod 600 "$HOME/.secrets"

# Git project-level .env.local
if git rev-parse --show-toplevel >/dev/null 2>&1; then
  PROJECT_ROOT=$(git rev-parse --show-toplevel)
  if [ -f "$PROJECT_ROOT/.env.local" ]; then
    source "$PROJECT_ROOT/.env.local"
    chmod 600 "$PROJECT_ROOT/.env.local"
    echo "→ Loaded local env: $PROJECT_ROOT/.env.local"
  fi
fi

# Direnv or fallback .envrc
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
elif [ -f ".envrc" ]; then
  source ".envrc"
fi

export DB_PATH="./sqlite.db"
export RENDERCV_LATEX_COMPILER="/usr/local/bin/pdflatex"

# ==========
# 🗃️ Custom Functions
# ==========
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  local cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ==========
# 🔒 Security & Auto Launch
# ==========
chmod 600 "$HOME/.zshrc" 2>/dev/null

# Auto-launch Zellij if not already in tmux or zellij
if command -v zellij >/dev/null 2>&1 && [ -z "$ZELLIJ" ] && [ -z "$TMUX" ]; then
  zellij attach -c default
fi

# ========== 💡 End of File ==========
