return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.diagnostics.golangci_lint,
      -- null_ls.builtins.diagnostics.mypy,
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.diagnostics.shellcheck,
      null_ls.builtins.diagnostics.yamllint,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.gofmt,
      null_ls.builtins.formatting.goimports,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.isort.with {
        generator_opts = {
          command = "isort",
          args = {
            "--stdout",
            "--profile",
            "black",
            "--filename",
            "$FILENAME",
            "-",
          },
          to_stdin = true,
        },
      },
    }
    return config -- return final config table
  end,
}
