# autoload -U promptinit; promptinit
# prompt pure
source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PROMPT='>'
printf "\e[92m" && figlet -f standard "Yo"


export GOOGLE_APPLICATION_CREDENTIALS=""

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () {
  # 1行あける
  print
  # カレントディレクトリ
  local left=' %{\e[38;5;2m%}(%~)%{\e[m%}'
  # バージョン管理されてた場合、ブランチ名
  vcs_info
  local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
  # スペースの長さを計算
  # テキストを装飾する場合、エスケープシーケンスをカウントしないようにします
  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))

  print -P $left${(r:$padwidth:: :)}$right
}
# ユーザ名@ホスト名
PROMPT='%>'
# 現在時刻
# RPROMPT=$'%{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'
TMOUT=1
TRAPALRM() {
  zle reset-prompt
}

alias act='source .venv/bin/activate'
