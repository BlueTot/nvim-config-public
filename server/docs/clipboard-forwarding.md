# Clipboard Forwarding

A procedure designed to setup clipboard forwarding over SSH from Windows Client to Ubuntu Server

### Setup

On windows, add this command to the `ps1` powershell script accessed through `$profile`

```
$env:DISPLAY="127.0.0.1:0"
```

On linux (over ssh), install `xsel`

In the ssh config file on windows, put the following:

```
ForwardX11 yes
ForwardX11Trusted yes
```

Lastly, install `VcXsrv` and start an *X11* server with the following settings:
- Multiple windows
- Display number 0
- Start no client
- Clipboard, Primary Selection, Native opengl, Disable access control
