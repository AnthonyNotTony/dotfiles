# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# Launch tmux if not inside a tmux session
if [[ -z "$TMUX" && -n "$PS1" && -n "$BASH_VERSION" ]]; then
    tmux
    exit
fi

# Display system information with neofetch
neofetch

# Launch fish if not inside a fish shell
if [ -z "$FISH" ] && [ -n "$BASH_VERSION" ] && [ -n "$PS1" ]; then
    fish
fi
