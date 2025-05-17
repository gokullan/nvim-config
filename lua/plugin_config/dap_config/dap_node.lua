require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- Make sure to update this path to point to your installation
    args = {"/home/d2c-gokulas/debug-adapters/js-debug-dap-v1.84.0/js-debug/src/dapDebugServer.js", "${port}"},
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
        "./configs/_config_gen/ind-service-config-local.yml",
        "--bootConfig",
        "../boot-config-ind/config.json"
    },
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Queuing Service",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}/lib/worker/init/init-messaging-worker.js",
    args = {
        "--unhandled-rejections",
        "strict",
        "--serviceConfig",
        "./configs/_config_gen/ind-service-config-local.yml",
        "--bootConfig",
        "../boot-config-ind/config.json"
    },
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "Re-queuing Service",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}/lib/worker/init/init-requeue-worker.js",
    args = {
        "--unhandled-rejections",
        "strict",
        "--serviceConfig",
        "./configs/_config_gen/ind-service-config-local.yml",
        "--bootConfig",
        "../boot-config-ind/config.json",
        "--autonomous"
    },
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  },
  {
    type = "pwa-node",
    request = "launch",
    name = "OPS",
    cwd = "${workspaceFolder}",
    program = "${workspaceFolder}/server.js",
    args = {
        "--env",
        "dev",
        "--bootConfig",
        "/boot-config/config.json"
    },
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  },
  {
    type = "pwa-node",
    request = "launch",
    cwd = "${workspaceFolder}",
    name = "Current file",
    program = "${file}",
    env = {
        NODE_TLS_REJECT_UNAUTHORIZED = 0
    }
  }
}
