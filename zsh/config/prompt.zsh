# =================== #
# Custom Shell Prompt #
# =================== #

LF=$'\n' # store line feed in a variable

# exit code: green if success, red if failure
EXIT_CODE="%(?.%F{green}.%F{red})exit %?%f"

# prompt header
#HEADER=""
#HEADER+="%F{39}%n%f " # username
#HEADER+="%F{81}%w%f"  # day today
#HEADER+="%F{81}%t%f " # time now
#HEADER+="${EXIT_CODE}"  # exit code

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{39}%f%K{39}%F{233}%s%f%k%K{245}%F{39}%f%%F{245}%K{240}%k%f%F{240}%K{236}%k%f%K{236} %F{39}%b|%a%f%k%F{236}%f'
zstyle ':vcs_info:*' formats       \
    '%F{39}%f%K{39}%F{233}%s%f%k%K{245}%F{39}%f%%F{245}%K{240}%k%f%F{240}%K{236}%k%f%K{236} %F{39}%b%f%k%F{236}%f'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# current working dir info
CWDINF="%F{39}%d%f "

SYMBOL="%F{81}ψ%f"

# prompt
#PROMPT=""
#PROMPT+="┌─ ${HEADER}${LF}" # full prompt header (HEADER)
#PROMPT+="│  ${CWDINF}${LF}" # full working directory name
#PROMPT+="└─ ${SYMBOL} "     # actual psi (capital) prompt

PROMPT="%F{39}%f%K{39}%F{233}%# %n %f%k" # username
PROMPT+="%K{81}%F{39}%f%F{233} %~ %f%k%F{81}%K{245}%k%f"
PROMPT+="%F{245}%K{240}%k%f%F{240}%K{236}%k%f" # separator
PROMPT+="%K{236} ${EXIT_CODE} %k%F{236} %k"

