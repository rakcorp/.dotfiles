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

# ================================ #
# Load the antigen package manager #
# ================================ #

builtin source "${ZSHCONFIG}/vendor/antigen.zsh"

# =============================== #
# List of plugins to be installed #
# =============================== #

# Fsh-like automatic suggestions for Zsh.
antigen bundle zsh-users/zsh-autosuggestions

# Fsh-like Syntax Highlighting for Zsh.
# This bundle should be the last one to be loaded.
antigen bundle zsh-users/zsh-syntax-highlighting

# ================================= #
# Install and Apply all the plugins #
# ================================= #

antigen apply

