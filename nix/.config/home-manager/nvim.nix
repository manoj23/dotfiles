{ pkgs, lib, ... }:
let
nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-25.05";
    });
in
{
  imports = [
    nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    extraPackages = with pkgs; [
      cppcheck
      cpplint
      fzf
      gopls
      hadolint
      lua-language-server
      markdownlint-cli
      marksman
      neocmakelsp
      pyright
      taplo
      shellcheck
      shellharden
      shfmt
      stylua
      texlab
      ripgrep
    ];

    extraConfigLua =
      ''
      vim.g.autoformat = false
      vim.opt.smarttab = false
      vim.opt.softtabstop = 0
      vim.opt.wrap = true
      vim.opt.ruler = true
      vim.opt.colorcolumn = "80"

      local SetTab = function(args)
        local tabsize = tonumber(args.args) or 4
        vim.opt.tabstop = tabsize
        vim.opt.shiftwidth = tabsize
      end
      local UseSpace = function(args)
        local tabsize = tonumber(args.args) or 4
        SetTab({ args = tabsize })
        vim.opt.expandtab = true
      end

      local UseTab = function(args)
        local tabsize = tonumber(args.args) or 4
        SetTab({ args = tabsize })
        vim.opt.expandtab = false  -- Use tabs instead of spaces
      end

      vim.api.nvim_create_user_command(
          "UseTab", UseTab, { nargs = "?" }
          )

      vim.api.nvim_create_user_command(
          "UseSpace", UseSpace, { nargs = "?" }
          )

      vim.api.nvim_create_user_command(
          "SetTab", SetTab, { nargs = "?" }
          )

      UseSpace({ args = "4" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function(args)
          vim.cmd("iabbrev print printf")
          vim.cmd('iabbrev #i #include')
          vim.cmd("iabbrev #d #define")
          vim.cmd("iabbrev stativ static")
        end
      })
      '';

    colorschemes.tokyonight = {
      enable = true;
      settings.style = "night";
    };
    plugins = {
      bufferline.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        ];
      };
      cmp_luasnip.enable = true;
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            bash = [
              "shellcheck"
              "shellharden"
              "shfmt"
            ];
            cpp = [ "clang_format" ];
            "_" = [
              "squeeze_blanks"
              "trim_whitespace"
              "trim_newlines"
            ];
          };
        };
      };
      flash.enable = true;
      friendly-snippets.enable = true;
      gitsigns.enable = true;
      illuminate.enable = true;
      indent-blankline.enable = true;
      lint = {
        enable = true;
        lintersByFt = {
          sh = [ "shellcheck" ];
          cpp = [ "cppcheck" "cpplint" ];
          c = [ "cppcheck" ];
        };
      };
      lazydev.enable = true;
      lspconfig.enable = true;
      lualine.enable = true;
      luasnip.enable = true;
      mini.enable = true;
      neo-tree.enable = true;
      neoconf.enable = true;
      snacks.enable = true;
      persistence.enable = true;
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };
      };
      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          cmake
          git_config
          gitcommit
          git_rebase
          gitignore
          gitattributes
          html
          javascript
          json
          lua
          markdown
          markdown_inline
          nix
          python
          query
          rust
          ron
          regex
          tsx
          typescript
          vim
          yaml
        ];
      };
      todo-comments.enable = true;
      treesitter-context.enable = true;
      treesitter-textobjects.enable = true;
      trouble.enable = true;
      ts-comments.enable = true;
      ts-context-commentstring.enable = true;
      web-devicons.enable = true;
      whitespace.enable = true;
    };

    keymaps = [
    # Telescope
    { mode = "n"; key = "<C-p>"; action = "<cmd>Telescope find_files<cr>"; options.noremap = true; }
    # You can simplify the C-b mapping; the multiple commands are redundant.
    { mode = "n"; key = "<C-b>"; action = "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>"; options.noremap = true; }

    # Saving
    { mode = "n"; key = "<C-s>"; action = ":w<CR>"; options.noremap = true; }

    # Buffer and tab navigation
    { mode = "n"; key = "<F2>"; action = ":bp<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F3>"; action = ":bn<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F4>"; action = ":bd<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F5>"; action = ":tabp<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F6>"; action = ":tabn<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F7>"; action = ":tabc<CR>"; options.noremap = true; }

    # Toggles
    { mode = "n"; key = "<F9>"; action = ":set hlsearch!<CR>"; options.noremap = true; }
    { mode = "n"; key = "<F12>"; action = ":set list!<CR>:redraw!<CR>"; options.noremap = true; }

    # Write with sudo
    { mode = "c"; key = "w!!"; action = "w !sudo tee > /dev/null %"; options.noremap = true; }
    ];
  };
}
