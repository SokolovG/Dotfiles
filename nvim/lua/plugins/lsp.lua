local lspconfig = require('lspconfig')

lspconfig.pyright.setup {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "basic", -- или "strict"
      },
    },
  },
}

-- TypeScript
lspconfig.ts_ls.setup({})

-- Rust
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

lspconfig.ruff.setup {}
