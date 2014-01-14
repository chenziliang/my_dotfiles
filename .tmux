# Let macvim started from tmux use system register
# run `brew install reattach-to-user-namespace` to install
set-option -g default-shell $SHELL
set-option -g default-command "reattach-to-user-namespace -l zsh"
bind y run "tmux save-buffer - | reattach-to-user-namespace pbcopy"
#unbind p
#bind p paste-buffer
bind -t vi-copy v begin-selection
bind -t vi-copy y copy-selection

unbind C-b
set -g prefix C-q
set-option -g base-index 1
set-window-option -g mode-keys vi
set-window-option -g utf8 on

unbind '"'
bind - splitw -v
unbind %
bind | splitw -h

bind k selectp -U
bind j selectp -D
bind h selectp -L
bind l selectp -R

# source config file
bind r source-file ~/.tmux.conf

#set -g mouse-resize-pane on
#set -g mouse-select-pane on
#set -g mouse-select-window on

# Clock
set -g clock-mode-style 24
set -g clock-mode-colour colour250

# Set history max
set -g history-limit 4096


# Highlight active window
set-window-option -g window-status-current-bg black
set-window-option -g window-status-current-fg white

# status line
# Set status bar
set -g status-utf8 on
set -g status-justify left
set -g status-bg green
set -g status-fg black
set -g status-interval 2
set -g status-left-length 60
set -g status-right-length 60
set -g status-right-bg colour74
set -g status-right '[ load #(uptime | awk \"{print \\$\(NF-2\)\\" \\"\\$\(NF-1\)\\" \\"\\$\(NF-0\)}\")  ] %Y-%m-%d %H:%M '
setw -g window-status-format " #I:#W "
'"'
