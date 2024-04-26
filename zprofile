eval $(/opt/homebrew/bin/brew shellenv)
eval "$(pyenv init --path)"

##############################################################################
# Path:

# Add the fpga stuff to path:
export PATH="/Users/joe/Programming/fpga/oss-cad-suite/bin:$PATH"

# add my personal bin folder and macvim last, so they override others if dupes:
export PATH="$HOME/bin:/Applications/MacVim.app/Contents/bin:$PATH"

# Load rbenv (Note: This updates the path, and not sure what else)
eval "$(rbenv init -)"

# Load pyenv (Note: This updates the path, and not sure what else)
eval "$(pyenv init -)"

# For programming a Raspberry Pi Pico
export PICO_SDK_PATH="$HOME/Programming/pico/pico-sdk"

# This sets where nvm can be found
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


