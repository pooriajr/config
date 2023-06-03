alias g='git'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gco='git checkout'
alias gs='git status'
alias gpl='git pull'
alias gp='git push'
alias gl='git log'
alias gw='git add . && git commit -m "WIP" && git push'

alias vi='nvim'

alias be='bundle exec'

alias ls='exa'
alias lsa='exa -a'

alias cat='bat'

# Open a GUI for postgres on the current directory's heroku project
alias heroku_pg_gui 'heroku config:get DATABASE_URL | xargs pgweb --url'

alias deploy="cap production deploy"

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='rg --files'

export EDITOR="nvim"

# fix for this error when running rails server: objc[52770]: +[__NSCFConstantString initialize] may have been in progress in another thread when fork() was called.
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export OPENAI_API_KEY='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'
