if status is-interactive
    # Commands to run in interactive sessions can go here
end

export GOPATH="/Users/pavelm/Documents/go"
export GOBIN="$GOPATH/bin"
export brewpath="/opt/homebrew/bin/"
set -x PATH $PATH /opt/homebrew/bin /opt

starship init fish | source
mcfly init fish | source
direnv hook fish | source

set -g direnv_fish_mode eval_on_arrow
alias vi="nvim"
alias git="/opt/homebrew/bin/git"
