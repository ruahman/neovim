local export = {}

function export.config()
    -- local dap = require('dap')

  require("flutter-tools").setup{
    debugger = {
      enabled = true,
      run_via_dap = true,
      register_configurations = function(paths)
        local dap = require('dap')

        -- debugger for dart
        dap.adapters.dart = {
          type = "executable",
          command = "dart",
          args = {"debug_adapter"}
        }

        -- debuge configurations 
        dap.configurations.dart = {
          {
            type = "dart",
            request = "launch",
            name = "Launch Dart Program",
            -- The nvim-dap plugin populates this variable with the filename of the current buffer
            program = "${file}",
            -- The nvim-dap plugin populates this variable with the editor's current working directory
            cwd = "${workspaceFolder}",
            args = {"--help"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
          }
        }

        -- dap.adapters.dart = {
        --   type = "executable",
        --   command = "flutter",
        --   args = { "debug-adapter" },
        --   options = { -- Dartls is slow to start so avoid warnings from nvim-dap
        --     initialize_timeout_sec = 30,
        --   },
        -- }

        -- dap.configurations.dart = {
        --   {
        --     name = "Launch flutter",
        --     type = "dart",
        --     request = "launch",
        --     dartSdkPath = paths.dart_sdk,
        --     flutterSdkPath = paths.flutter_sdk,
        --     program = "${workspaceFolder}/lib/main.dart",
        --     cwd = "${workspaceFolder}",
        --   },
        --   {
        --     name = "Connect flutter",
        --     type = "dart",
        --     request = "attach",
        --     dartSdkPath = paths.dart_sdk,
        --     flutterSdkPath = paths.flutter_sdk,
        --     program = "${workspaceFolder}/lib/main.dart",
        --     cwd = "${workspaceFolder}",
        --   },
        -- }
      end
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
        virtual_text = true,
      },
      on_attach = require("plugins.lsp").on_attach,
      capabilities = require("plugins.lsp").capabilities,
    }
  }
end

return export
