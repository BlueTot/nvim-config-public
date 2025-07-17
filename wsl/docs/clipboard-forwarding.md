# Clipboard Forwarding

A procedure designed to setup clipboard forwarding from WSL to windows

### Setup

On WSL, install `xclip`

Install `VcXsrv` and start an *X11* server with the following settings:

* Multiple windows
* Display number 0
* Start no client
* Clipboard, Primary Selection, Native opengl, Disable access control

### Debugging

Use `echo $DISPLAY` to check if the display has been set. `xclock` can also be used to check if the X11 forwarding is working.
