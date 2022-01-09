#  /Users/jazz/.oh-my-zsh/custom/plugins

. /Users/jazz/.oh-my-zsh/custom/plugins/z/z.sh


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/Users/jazz/.oh-my-zsh"

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
source /Users/jazz/.zprofile
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"

# kitty
autoload -Uz compinit
compinit
alias ktheme-reset="kitty @set-colors -a -c --reset"
alias ktheme="cd ~/.config/kitty/kitty-themes && fzf --preview 'head -n 40 {} && kitty @set-colors -a -c {}'; cd -"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULTS_OPS="--extended"
alias fz=fzf
alias fzp="fzf --preview 'bat --color=always --style=numbers --line-range=:500   {}'"
# alias fzp="fzf --preview 'head -n 40 {}'"
complete -F _fzf_path_completion -o default -o bashdefault ll

# opam configuration
test -r /Users/jazz/.opam/opam-init/init.zsh && . /Users/jazz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# alias
alias vim="nvim"
alias vi="nvim"
alias sy='systemctl'
alias git='LANG=en_US.UTF-8 git'
alias github="git config --local user.name 'nyinyithann'; git config --local user.email 'nyinyithann@gmail.com'"
alias dir="ls -ld */"
alias dirs="dirs -v"
alias cls="clear"
alias copy="pbcopy"
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias cls-hist="history -c"
alias fsi="dotnet fsi"

# ocaml related
alias dut="dune test"
alias dub="dune build"
alias duc="dune clean"
alias duem="dune exec ./main.exe"
alias eb="esy build"
alias nes="npx esy start"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
alias dfiles="code ~/my/dotfiles/dotfiles.code-workspace"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Open Folders
alias cd-vimplugins="cd ~/.local/share/nvim/site/pack/jazz/start"

# Open Repos
alias mynotes="nohup /Applications/Joplin.app/Contents/MacOS/Joplin ~/my/mynotes &!"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


source /Users/jazz/.config/broot/launcher/bash/br

# weather 
alias we="curl http://wttr.in"
alias weather="curl http://wttr.in"

# elasticsearch
alias elastic="/usr/local/Cellar/elasticsearch-full/7.15.1/bin/elasticsearch"
alias kibana="/usr/local/Cellar/kibana-full/7.15.1/bin/kibana"
alias elastic_config="cd /usr/local/etc/elasticsearch"
alias logstash="/usr/local/Cellar/logstash/7.13.4/bin/logstash"
if [ -e /Users/jazz/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jazz/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# tmuxinator
alias mux=tmuxinator

# exa 
alias sh="exa --icons -l -s=type --no-permissions --no-user"
