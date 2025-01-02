
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

# Use a separate history file for each directory.
# HISTDIR="${XDG_STATE_HOME}/zsh${PWD}"
# mkdir -p -- "$HISTDIR" # Create the directory if it doesn't exist.
export HISTFILE="${XDG_STATE_HOME}/zsh/history"

# Various ZSH History options.
export HISTSIZE=10000 # Cap history at 10,000 entries.
export SAVEHIST=10000 # Save the last 10,000 commands.
setopt SHARE_HISTORY  # Sync history between zsh and its history file.
