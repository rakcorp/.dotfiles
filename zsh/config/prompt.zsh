# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Copyright © 2023 Rak Laptudirm <rak@laptudirm.com>                        #
#                                                                           #
# Licensed under the Apache License, Version 2.0 (the "License");           #
# you may not use this file except in compliance with the License.          #
# You may obtain a copy of the License at                                   #
# http://www.apache.org/licenses/LICENSE-2.0                                #
#                                                                           #
# Unless required by applicable law or agreed to in writing, software       #
# distributed under the License is distributed on an "AS IS" BASIS,         #
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  #
# See the License for the specific language governing permissions and       #
# limitations under the License.                                            #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

# =================== #
# Custom Shell Prompt #
# =================== #

# Shell Right Prompt:
VCS_NORMAL="" # ( ~vcs~ >>> branch~ )
VCS_NORMAL+="%F{39}%f%K{39}%F{233}%s%f%k"                            # ( ~vcs~
VCS_NORMAL+="%K{245}%F{39}%f%%F{245}%K{240}%k%f%F{240}%K{236}%k%f" # >>> # separator
VCS_NORMAL+="%K{236} %F{39}%b%u%c%f%k%F{236}%f"                      # branch~ )

# Shell Right Prompt:
VCS_ACTION="" # ( ~vcs~ >>> branch~ )
VCS_ACTION+="%F{39}%f%K{39}%F{233}%s %a%f%k"                         # ( ~vcs~
VCS_ACTION+="%K{245}%F{39}%f%%F{245}%K{240}%k%f%F{240}%K{236}%k%f" # >>> # separator
VCS_ACTION+="%K{236} %F{39}%b%u%c%f%k%F{236}%f"                      # branch~ )

# Exit Code: green if success, red if failure.
EXIT_CODE="%(?.%F{green}.%F{red})exit %?%f"

# Shell Main Prompt:
PROMPT="" # (% username > working dir >>> exit code > |
PROMPT+="%F{39}%f%K{39}%F{233}%# %n %f%k"                 # (% username
PROMPT+="%K{81}%F{39}%f%F{233} %~ %f%k%F{81}%K{245}%k%f" # > working dir >
PROMPT+="%F{245}%K{240}%k%f%F{240}%K{236}%k%f"           # >> # separator
PROMPT+="%K{236} ${EXIT_CODE} %k%F{236} %k"               # exit code > |

# ===================================== #
# Generate VCS Info to populate RPROMPT #
# ===================================== #

setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' formats $VCS_NORMAL
zstyle ':vcs_info:*' actionformats $VCS_ACTION
zstyle ':vcs_info:*' enable git cvs svn

# vcs_info_wrapper to allow prompt expansion.
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "${vcs_info_msg_0_}"
  fi
}

# Reset RPROMPT so to enable prompt expansion.
RPROMPT=$'$(vcs_info_wrapper)'


