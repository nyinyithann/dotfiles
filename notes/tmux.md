# Tmux Shortcuts

### session

- create new session
  <br/>`tmux new -s session-name`

- exit session
  </br> `exit`
- kill session
  <br/>`tmux kill-session -t session-name`

- detach session
  <br/>`Ctrl + b, d`

- attach session
  <br/>`tmux attach` if having a single session
  <br/>`tmux attach -t session-name`

- list sessions
  <br/> `Ctrl + b, s`
- switch previous session
  <br/> `Ctrl + b, (`
- switch next session
  <br/> `Ctrl + b, )`
- move window between sessions
  <br/> `Ctrl + b, .`

### window

- create a session with a named window
  <br/>`tmux new -s session-name -n window-name`
- create a new window
  <br/>`Ctrl + b, c`
- rename a window
  <br/>`Ctrl + b, ,`
- moving between windows
  <br/> `Ctrl + b, n` next window
  <br/> `Ctrl + b, p` previous window
  <br/> `Ctrl + b, 0` window 0
  <br/> `Ctrl + b, w` display list of windows
  <br/> `Ctrl + b, f` find window name
- close window
  <br/> `Ctrl + b, &` or `exit`

## pane

- new horizontal pane
  <br/> `Ctrl + b, %`
  <br/> `Ctrl + b, |` my key binding
- new vertical pane
  <br/> `Ctrl + b, "`
  <br/> `Ctrl + b, -` my key binding
- cycle through panes
  <br/> `Ctrl + b, o`
- moving between panes
  <br/> `Ctrl + b, Arrow Keys` press `Ctrl + b` and then Arrow Keys to resize pane
  <br/> `Ctrl + b, h,j,k,l` press `Ctrl + b, H,J,K,L` to resize pane (My Key binding)
- cycle through layouts
  <br/> `Ctrl + b, space`
- close pane
  <br/> `Ctrl + b, x` or `exit`

- pane to window
  <br/> `Ctrl + b, !`
- window to pane
  <br/> `join-pane session_name:window.pane -t target_session_name:window.pane`
- pane fullscreen
  <br/> `break-pane` use `join-pane` to place it back

## command mode

- enter command mode
  <br/> `Ctrl + b, :`
- new window command
  <br/> `new-window -n name` or with `"program name"`

- list of predefined key bindings
  <br/> `Ctrl + b, ?`

- reload config
  <br/> `source-file ~/.tmux.conf` or `Ctrl + b, r` (my key binding)

### TPM plugin manager

- `Ctrl + b, I` install plugins
- `Ctrl + b, u` update plugins

### tmuxinator

- `tmuxinator open name-here.yml` new/update config file
- `tmuxinator name-here.yml` to open
