
if [ ! -e ~/.kunyuan.sh ]; then
  cat >> ~/.kunyuan.sh << EOF
set -o vi
bind -x '"\C-l": clear'
bind '"kj":vi-movement-mode'

export EDITOR=vim
EOF
else
  echo "skip creating ~/.kunyuan.sh"
fi

if ! grep ".kunyuan.sh" ~/.bashrc &> /dev/null; then
  echo "source ~/.kunyuan.sh" >> ~/.bashrc
else
  echo "skip appending ~/.bashrc"
fi

if ! grep "function add_path" ~/.kunyuan.sh &> /dev/null; then
  cat >> ~/.kunyuan.sh << 'EOF'
function add_path() {
  export PATH="$1":${PATH}
}
EOF
else
  echo "skip add_path"
fi

if ! grep "function add_lib_path" ~/.kunyuan.sh &> /dev/null; then
  cat >> ~/.kunyuan.sh << 'EOF'
function add_lib_path() {
  export LD_LIBRARY_PATH="$1":${LD_LIBRARY_PATH}
}
EOF
else
  echo "skip add_lib_path"
fi

cat >> ~/.kunyuan.sh << 'EOF'
# show files with color in iterm on macOS
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

alias gs="git status"
alias gb="git branch"
alias gd="git difftool"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
EOF
