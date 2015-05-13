
# ヒストリ検索にpecoを利用。
function peco-select-history() {
  emulate -L zsh

  local delimiter=$'\0; \0'
  local newline=$'\n'

  BUFFER=${"$(print -rl ${history//$newline/$delimiter} | peco --query "$LBUFFER")"//$delimiter/$newline}
  CURSOR=$#BUFFER
  zle -Rc
  zle reset-prompt
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# プロセスのkillにpecoを利用。キーはバインドしていない。
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
      kill $pid
      echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

# git addするファイルの選択(Ctrl-g Ctrl-a)
function peco-select-git-add() {
  local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
                                peco --query "$LBUFFER" | \
                                awk -F ' ' '{print $NF}')"
  if [ -n "$SELECTED_FILE_TO_ADD" ]; then
    BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
    CURSOR=$#BUFFER
  fi
  zle accept-line
  # zle clear-screen
}
zle -N peco-select-git-add

bindkey "^g^a" peco-select-git-add

# gemの保存先に移動(戻りたい場合は $ cd -)。
function peco-cd-gem() {
  local gem_name=$(bundle list | sed -e 's/^ *\* *//g' | peco | cut -d \  -f 1)
  if [ -n "$gem_name" ]; then
    local gem_dir=$(bundle show ${gem_name})
    echo "cd to ${gem_dir}"
    cd ${gem_dir}
  fi
}
alias pcdg="peco-cd-gem"

# ~/.ssh/configからsshで接続する候補を選択。
function peco-ssh() {
  local result=$(grep ^Host ~/.ssh/config |awk '{print $2}' | grep -v '*' | peco)

  if [ -n "$result" ]; then
    \ssh ${result}
  fi
}
alias pes="peco-ssh"

# Local variables:
# mode: sh
# coding: utf-8
# End:
