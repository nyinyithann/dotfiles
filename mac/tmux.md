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
- new vertical pane
<br/> `Ctrl + b, "`
- cycle through panes
<br/> `Ctrl + b, o`
- moving between panes
<br/> `Ctrl + b, Arrow Keys`  press `Ctrl + b` and then Arrow Keys to resize pane
- cycle through layouts
<br/> `Ctrl + b, space`
- close pane
<br/> `Ctrl + b, x` or `exit`

## command mode

- enter command mode
<br/> `Ctrl + b, :`
- new window command
<br/> `new-window -n name`  or with `"program name"`

- list of predefined key bindings
<br/> `Ctrl + b, ?`