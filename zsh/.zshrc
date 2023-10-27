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

# ======================= #
# Configuration Directory #
# ======================= #

export ZSHCONFIG="${XDG_CONFIG_HOME}/zsh"

# ========================= #
# Pre-Command Configuration #
# ========================= #

# Keep a list of reload times to
# allow for efficient hot reloads.
declare -A LAST_RELOAD

# usage: hot_reload <file>
#
# hot_reload tries to include the source of the given
# shell script into the source of the current script.
# hot_reload doesn't include the provided file if it
# doesn't exist or if it hasn't been modified since the
# last time it was included by this function.
hot_reload() {

  # Do nothing if there is no $1.
  [[ -e $1 ]] || return 0
  
  # Check if $1 has been modified since last reload.
  # The modifier `(:A)` resolves any symbolic links.
  if [[ $LAST_RELOAD[$1] < $(date -r $1(:A) +%s) ]]; then

    # File has been updated after last reload.
    # Reload the new file from its source.
    builtin source $1

    # File reloaded, so update last reload time.
    LAST_RELOAD[$1]=$(date +%s)
  fi
}

precmd() {
  # Use a separate history file for each directory.
  export HISTFILE="${PWD}/.zsh_history"

  # Hot-reload any updated config files.
  for file in ${ZSHCONFIG}/config/*.zsh; do
    hot_reload "$file"
  done
}

# ================ #
# Startup Commands #
# ================ #

eval $(thefuck --alias) # fuck --yeah
neofetch # :)

