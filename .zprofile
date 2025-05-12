# All the PATHs should be set up in .zprofile.
# First set up paths for homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Setting up PATH for ASDF
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
