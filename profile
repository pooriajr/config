alias g='git'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gs='git status'
alias gp='git push'
alias gl='git log'
alias gc='git commit'

alias vi='nvim'

alias be='bundle exec'

alias ls='exa'
alias lsa='exa -a'

alias cat='bat'

# Open a GUI for postgres on the current directory's heroku project
alias heroku_pg_gui 'heroku config:get DATABASE_URL | xargs pgweb --url'

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='rg --files'
