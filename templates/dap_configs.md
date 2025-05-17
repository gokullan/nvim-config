# `dap` - Sample Configs

## Predefined variables
- `workspaceFolder`
- `file` (current file)
- `port`

## Node
```lua
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- Make sure to update this path to point to your installation
    args = {"/home/user/debug-adapters/js-debug-dap-v1.84.0/js-debug/src/dapDebugServer.js", "${port}"},
  }
}

require("dap").configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Main Service",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}/server.js",
    args = {
        "--serviceConfig",
        "./configs/config.yml",
    },
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  },
  {
    -- another config
  }
}
```

## Golang
```lua
local dap = require "dap"
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/debug-adapters/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Go App Debug';
    request = 'launch';
    showLog = false;
    program = "${workspaceFolder}/server.go";
    asRoot = true;
    args = {
        "-config",
        "/home/user/development.json",
        "-ip",
        "127.0.0.1",
        "-port",
        "8889",
        "-env",
        "development"
    };
    dlvToolPath = vim.fn.exepath('/home/user/go/bin/dlv')  -- Adjust to where delve is installed
  },
}
```

## Python
```lua
require('dap-python').setup('/home/user/my-venv/bin/python')
require('dap').configurations.python = {
      {
        type = 'debugpy';
	    python = '/home/user/python-app-dir/my-venv2/bin/python';
        request = 'launch';
        name = "DAGG seed";
        program = "${file}";
        env = {
          DATA_AGGREGATOR_ENV = "local_orders";
          TENANT = "ind"
        };
        justMyCode = false
      },
      {
        -- celery config
        type = 'debugpy';
	    python = '/home/user/python-app-dir/my-venv4/bin/python';
        request = 'launch';
	    subProcess = true;
	    console = "integratedTerminal";
	    module = "celery";
        name = "Celery Worker";
        env = {
          TENANT = "ind"
        };
        args = {
          "--app=app.worker",
          "--workdir=/home/user/python-app-dir",
          "worker",
          "--pool=solo",
          "--logfile=/home/user/celery_logs/celeryd-worker.log"
        };
        justMyCode = false
      }
    }
```

