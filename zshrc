zmodload zsh/zprof 
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH



# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# >>> miniconda init >>>
# install miniconda for pytroch
  eval "$(/home/cyn/miniconda3/bin/conda shell.zsh hook)"



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cyn/softwares/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cyn/softwares/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cyn/softwares/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cyn/softwares/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export CARLA_ROOT=/home/cyn/CARLA/carla_leadboard/carla
export SCENARIO_RUNNER_ROOT=/home/cyn/CARLA/carla_leadboard/scenario_runner
export LEADERBOARD_ROOT=/home/cyn/CARLA/carla_leadboard/leaderboard
export PYTHONPATH="${CARLA_ROOT}/PythonAPI/carla/":"${SCENARIO_RUNNER_ROOT}":"${LEADERBOARD_ROOT}":"${CARLA_ROOT}/PythonAPI/carla/dist/carla-0.9.13-py3.7-linux-x86_64.egg":${PYTHONPATH}

# ============= my_shit ===============
# ------ z.lua -------

eval "$(lua  ~/.oh-my-zsh/custom/plugins/z.lua/z.lua --init zsh enhanced once echo)"

# ------ ROS ------
#if [ -f "/opt/ros/noetic/setup.bash" ]; then
export ROS_DOMAIN_ID=66
export ROS_LOCALHOST_ONLY=1
#source /opt/ros/noetic/setup.bash
#fi

export ROS_DOMAIN_ID=66

if [ -f "/opt/ros/foxy/setup.zsh" ]; then
source /opt/ros/foxy/setup.zsh
fi
if [ -f "/opt/ros/noetic/setup.zsh" ]; then
source /opt/ros/noetic/setup.zsh
fi


source /home/cyn/.config/broot/launcher/bash/br
#------ Qt ------
export QT_DEBUG_PLUGINS=1
# =============== my_start ================
# ------ dictionary ------
# goldendict &
# =============== my_scripts ================
# --- clash ---
source ~/dotfiles/scripts/clash.sh

# --- alias ---
alias '..=cd ..'
alias '...=cd ../..'
alias 'glll=git log --all --graph --decorate'
alias 'gll=git log --all --graph --oneline'
export APOLLO_ROOT_DIR=/home/cyn/CARLA/apollo

#------ pyenv ------
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cyn/google-cloud-sdk/path.zsh.inc' ]; then . '/home/cyn/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/cyn/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/cyn/google-cloud-sdk/completion.zsh.inc'; fi
