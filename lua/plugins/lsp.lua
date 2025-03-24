return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {
          settings = {
            disableOrganizeImports = true,
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                diagnosticSeverityOverrides = {
                  reportOptionalMemberAccess = 'warning',
                  reportOptionalSubscript = 'warning',
                  reportOptionalCall = 'warning',
                  reportGeneralTypeIssues = 'warning',
                  reportPossiblyUnboundVariable = 'warning',
                  reportUnboundVariable = 'warning',
                  reportAssignmentType = 'warning',
                  reportArgumentType = 'warning',
                  reportInvalidTypeArguments = 'warning',
                  reportAttributeAccessIssue = 'warning',
                },
                diagnosticMode = 'openFilesOnly',
              },
            },
          },
        },
      },
    },
  },
}
