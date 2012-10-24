# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="flazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

unsetopt correctall

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

export EDITOR="vim"

export PATH="/Users/rdeits/Documents/Scripting:${PATH}"
export PATH="/Users/rdeits/Documents/Scripting/gpambrozio-python-scripts/PythonDocs2DocSet:${PATH}"
export CMAKE_MODULE_PATH="/usr/local/Cellar/apiextractor/0.10.10/lib/cmake/ApiExtractor-0.10.10:${CMAKE_MODULE_PATH}"

export CPLUS_INCLUDE_PATH="/usr/local/include:$CPLUS_INCLUDE_PATH"

############################# Android Dev #############################

export PATH="/Users/rdeits/Documents/Tools/android-sdk-mac_x86/platform-tools:${PATH}"
export PATH="/Users/rdeits/Documents/Tools/android-sdk-mac_x86/tools:${PATH}"

############################# Homebrew #############################

export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:${PATH}"
export PATH="/usr/local/share/python:$PATH"

############################# Aliases #############################

alias athena='ssh rdeits@linux.dialup.mit.edu'
alias nethack='/usr/games/nethack'
alias tightvnc='bash ~/Documents/Scripting/tightvnc.command'

############################# Python #############################

alias ipynb='ipython notebook --pylab inline'
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH"
export PYTHONPATH="/usr/local/Cellar/wxpython/2.9.2.4/lib/python2.7/site-packages:$PYTHONPATH"

############################# Python Projects #############################
export PYTHONPATH="/Users/rdeits/Dropbox/RoboClam/Software/python:$PYTHONPATH"
export PYTHONPATH="/Users/rdeits/Dropbox/RoboClam/py:${PYTHONPATH}"
export PYTHONPATH="/Users/rdeits/Documents/Scripting:${PYTHONPATH}"
export PYTHONPATH="/Users/rdeits/Projects/ScratchHolograms:${PYTHONPATH}"

############################# Other Programs #############################

#HDF5 path
# export HDF5_DIR=/opt/local/lib

#LilyPond music notation path
export PATH=$PATH:~/bin

# Necessary for installing TextMate bundles with non-ASCII names
export LC_CTYPE=en_US.UTF-8

# Libraries for HDF5 file format
# export LD_LIBRARY_PATH=/Users/rdeits/Library/hdf5-1.8.5-patch1-macosx64-static/bin:$LD_LIBRARY_PATH

# RVM (ruby version manager)
[[ -s "/Users/rdeits/.rvm/scripts/rvm" ]] && source "/Users/rdeits/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
rvm use ruby-1.9.3-p194 >> /dev/null

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '%(!.!.➜)'
}

PROMPT='%{$fg_bold[green]%}%n@%m %{$fg[cyan]%}%2c %{$fg_bold[red]%}$(prompt_char) % %{$reset_color%}'

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
RPROMPT='$(vi_mode_prompt_info) ${return_code}  %{$fg_bold[blue]%}$(git_prompt_info) %{$fg_bold[green]%}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

source ~/.local.zsh
