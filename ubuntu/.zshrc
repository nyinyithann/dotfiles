# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/nnt/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="agnoster"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

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
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opam configuration
test -r /home/nnt/.opam/opam-init/init.zsh && . /home/nnt/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# linux commands
alias cal="ncal -M -b"
alias dir="ls -ld */"
alias dirs="dirs -v"
alias cls="clear"
alias copy="xsel -ib"

# configs & settings
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias vssetting='code ~/.config/Code/User/settings.json'
alias kmap="xmodmap ~/.xmodmap && xcape -e 'Mode_switch=Escape'"
alias aconfig="code /home/nnt/.config/alacritty/alacritty.yml"
alias deskconfig="code ~/.config/gtk-4.0/gtk.css"
alias cls-hist="history -c"

# folders
alias pg="cd /sda1/playground; ls"
alias ebooks="cd /home/nnt/Dropbox/1_EBooks_Ultimate; nohup xdg-open /home/nnt/Dropbox/1_EBooks_Ultimate &!"

# open apps
alias ws="nohup webstorm . &!"
alias pdf="nohup okular &!"
alias open="xdg-open"

# donet cli
alias drun='dotnet run'
alias dbuild='dotnet build'
alias fsi="dotnet fsi"

# dotnet folder
alias csfolder="cd /sda1/playground/csharp; ls"
alias qnbsln="nohup rider /sda1/playground/csharp/QAndB/QAndB.sln &!"
export PATH=/home/nnt/.dotnet:$PATH
export PATH="$PATH:/home/nnt/.dotnet/tools"
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))

# react & node
alias react-code="cd /sda1/playground/react-learning; nohup code /sda1/playground/react-learning/react-learning.code-workspace &!"
alias react-ws="cd /sda1/playground/react-learning; nohup webstorm /sda1/playground/react-learning &!"
alias react-tp="cd /sda1/react-webpack-template; nohup code /sda1/react-webpack-template &!"
alias react-projects="cd /sda1/playground/react-learning/projects; dir"
alias ns="npm start"
alias ys="yarn start"

# rescript
alias cdres="cd /sda1/rescript-lab; ls"

# MyNotes
alias mynotes="nohup typora /sda1/MyNotes &!"

# open folders, projects, workspaces
alias dfiles="code dotfiles.code-workspace"

# kitty
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
alias icat="kitty +kitten icat"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$PATH:$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

# sql server
export PATH="$PATH:/opt/mssql-tools/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# explore rescript
alias cd-reslab="cd /sda1/rescript-lab"
alias code-reslab="cd /sda1/rescript-lab; nohup code /sda1/rescript-lab &!"
alias explore-res="cd /sda1/rescript-lab/explore-rescript; nohup code /sda1/rescript-lab/explore-rescript &!"
alias fs-src="cd /sda1/source_repo/dotnet/fsharp/fsharp; nohup rider /sda1/source_repo/dotnet/fsharp/fsharp/FSharp.sln &!"
alias res-compiler="cd /sda1/source_repo/rescript/rescript-compiler; nohup code /sda1/source_repo/rescript/rescript-compiler &!"
alias res-langorg="cd /sda1/source_repo/rescript/rescript-lang.org; nohup code /sda1/source_repo/rescript/rescript-lang.org &!"
alias arrayex="cd /sda1/rescript-js-array2-ex; nohup code /sda1/rescript-js-array2-ex &!"
alias res-src="cd /sda1/source_repo/rescript; nohup code /sda1/source_repo/rescript &!"

alias nvimconfig="subl $HOME/.config/nvim/init.vim"
alias cd-nvimplugin="cd /home/nnt/.local/share/nvim/site/pack/coc/start"

alias kittyconfig="subl ~/.config/kitty/kitty.conf"
alias ktheme-reset="kitty @set-colors -a -c --reset"
alias ktheme="cd ~/.config/kitty/themes && fzf --preview 'head -n 40 {} && kitty @set-colors -a -c {}'; cd -"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULTS_OPS="--extended"
alias fz=fzf
alias fzp="fzf --preview 'head -n 40 {}'"
complete -F _fzf_path_completion -o default -o bashdefault ll
