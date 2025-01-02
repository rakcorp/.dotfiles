# ============================ #
# Common Environment Variables #
# ============================ #

export EDITOR="nvim"

# ======================= #
# Compiler Specifications #
# ======================= #

export CC="clang"
export CXX="clang++"

# =========================== #
# XDG Directory Specification #
# =========================== #

# User-specific and important Data Files.
export XDG_DATA_HOME="${HOME}/.local/share/"

# Logs/History/Recently-used Files
export XDG_STATE_HOME="${HOME}/.local/state"

# Non-essential/Cached Files:
# Its removal MUST NOT be noticed by the
# user, except for (maybe large) perf hits.
export XDG_CACHE_HOME="${HOME}/.cache"

# User-specific Config Files:
# Removing this results in everything
# switching to default preferences.
export XDG_CONFIG_HOME="${HOME}/.config"

