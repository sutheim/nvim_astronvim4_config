# AstroNvim Template

**NOTE:** This is for AstroNvim v4+

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

Unix
```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

Powershell
```powershell
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

#### Clone the repository

Unix
```shell
git clone https://github.com/sutheim/nvim_astronvim4_config.git ~/.config/nvim
```

Powershell
```powershell
git clone https://github.com/sutheim/nvim_astronvim4_config.git $env:LOCALAPPDATA\nvim
```

#### Start Neovim

```shell
nvim
```
