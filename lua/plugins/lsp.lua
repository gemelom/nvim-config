return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        ty = {
          settings = {},
        },
        pyright = {
          enabled = false,
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
                  reportReturnType = 'warning',
                },
                diagnosticMode = 'openFilesOnly',
              },
            },
          },
        },
        ruff = {
          settings = {
            lint = {
              ignore = {
                'F541',
              },
            },
          },
        },
      },
    },
  },
}
