# Neovim Configuration

This is a Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim), a modern Neovim configuration framework. It provides a highly customizable and efficient development environment with various plugins and configurations.

## Features

Mainly used for Python development, this configuration provides the following features:

- **AI Integration**: Powered by [avante.nvim](https://github.com/yetone/avante.nvim) with support for multiple AI providers
- **UI Enhancements**: Beautiful UI with [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) theme and [noice.nvim](https://github.com/folke/noice.nvim) for better UI elements
- **LSP Support**: Built-in LSP configuration with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) using [pyright](https://github.com/microsoft/pyright) and [ruff](https://github.com/astral-sh/ruff)
- **Debugging**: Integrated debugging with [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)
- **Buffer Management**: Efficient buffer management with [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
- **Code Completion**: Enhanced completion with [blink.cmp](https://github.com/saghen/blink.cmp) and AI integration

## Installation

1. Install Neovim (>= 0.9.0)
2. Backup existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim_backup
   ```
2. Clone this repository:
   ```bash
   git clone https://github.com/gemelom/nvim-config ~/.config/nvim
   ```
3. Start Neovim and wait for the plugins to install

## License

MIT License
