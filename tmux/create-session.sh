#!/usr/bin/env bash

# bash script that creates a new tmux session  and sets up multiple panes within that session with specific configurations and commands.
# If the session does not already exist, it creates it and sets up the panes accordingly. Finally, it attaches to the created session
#
session_name='foo'

tmux has-session -t $session_name
if [ $? != 0 ]
then

    # SESSION

    cd ~/tomekz/dotfiles
    tmux new-session               -ds $session_name
    tmux set-window-option          -t $session_name     allow-rename off
    tmux rename-window              -t $session_name:1   outerrim

    tmux select-pane                -P 'bg=colour156,fg=colour17'
    tmux send-keys                  -t $session_name:1.1 'v' C-m

    tmux split-window      -v -p 15 -t $session_name:1
    tmux select-pane                -P 'bg=colour202,fg=colour231'
    # tmux send-keys                  -t $session_name:0.1 'watch -n 5 -t -c "docker ps --format json --filter name=jawa | jq --slurp -r  \".[]|[.Names,.Image,.Status] | @tsv\" | column -t"' C-m

    tmux split-window      -h -p 70 -t $session_name:1
    tmux select-pane                -P 'bg=colour159,fg=colour27'

    tmux select-pane                -t 1
    tmux split-window      -v -p 15 -t $session_name:1
    tmux select-pane                -P 'bg=colour229,fg=colour33'
    # tmux send-keys                  -t $session_name:0.2 'watch -t -n 5 -c "docker stats --no-stream --format json | jq --slurp -r \".[]|[.Name, .MemUsage, .MemPerc, .CPUPerc] | @tsv\" | grep \"jawa_\"| column -t"' C-m

    tmux select-pane                -t 1
fi

tmux attach -t $session_name
