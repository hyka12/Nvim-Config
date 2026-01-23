# Introduction 
This repo hosts my Nvim personal configuration for Linux and Windows, install instructions below.

# Features
+ Lightweight Plugin Manager, Vim-Plug
+ Dashboard, Lualine, and Code Highlighting
+ Highly Compatible Colorscheme
+ Language-Server-Protocol support via nvim-lspconfig

# Install and setup

<details>
<summary>Linux</summary>
  
```
[ -d "$HOME/.local/share/nvim" ] && rm -rf "$HOME/.local/share/nvim" && mkdir -p ~/.config/nvim && cd ~/.config/nvim && rm -rf . && git clone https://github.com/hyka12/Nvim-Config.git . && rm README.md
```
</details><details><summary>Windows</summary>
  
```
if exist "%LOCALAPPDATA%\nvim" rmdir /s /q "%LOCALAPPDATA%\nvim" && mkdir "%LOCALAPPDATA%\nvim" && cd "%LOCALAPPDATA%\nvim" && git clone https://github.com/hyka12/Nvim-Config.git . && del README.md
```
</details>
