# My Neovim Config

A repository for my current *server* and *WSL* neovim configs along with extra tools

The current system is designed for **general coding** and **markdown editing** for note taking, fitted with *remote clipboard forwarding* and *clipboard image pasting* capabilities. Note that this config is for linux.

## Installation

Install Neovim v0.11.3 (or newer). These commands are for Linux x86_64, visit the [github page](https://github.com/neovim/neovim/releases) to find downloads for other setups.

```bash
wget https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
echo "alias nvim=~/nvim-linux-x86_64/bin/nvim" >> ~/.bashrc
source ~/.bashrc
```

You can now run neovim by the `nvim` command.

Next, clone this repo into `~/.config/nvim` to setup the config.

```bash
mkdir -p ~/.config/nvim
git clone https://github.com/BlueTot/nvim-config-public.git ~/.config/nvim
cd ~/.config/nvim
rm -r wsl/
mv server/* .
rmdir server
```

You have to choose a provided config, in this case the `server` config is chosen. 

If using normally, either config is fine. The `server` config is for working over SSH, whilst the `wsl` config is for working in WSL on Windows. Read the `docs` directory for more info on how to setup clipboard forwarding and image pasting.

Open the plugin manager file:

```bash
nvim lua/bluetot/packer.lua
```

Run these commands in neovim to install the plugins.

```bash
:so
:PackerSync
```

The `latex` treesitter parser has a dependency, which can be installed. You might need to install Node.js - read [this](https://nodejs.org/en/download)

```bash
npm install -g tree-sitter-cli
```

Lastly, this config uses Tatum, a CLI tool for markdown editing. Visit [here](https://github.com/BlueTot/tatum) and follow the instructions to install.

There may be other dependencies; search online if there are any errors upon starting nvim again.

