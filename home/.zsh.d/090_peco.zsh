
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

# Local variables:
# mode: sh
# coding: utf-8
# End:
