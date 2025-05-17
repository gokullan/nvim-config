local dap = require "dap"
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/debug-adapters/vscode-go/dist/debugAdapter.js'};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = vim.fn.exepath('/home/d2c-gokulas/go/bin/dlv')
  },
  {
    type = 'go';
    name = 'DPS Debug';
    request = 'launch';
    showLog = false;
    program = "./data-pipeline-service/data_pipeline_service.go";
    asRoot = true;
    args = {
        "-config",
        "/home/d2c-gokulas/seaecom/dps/data-pipeline-service/configs/ind/development.json",
        "-ip",
        "127.0.0.1",
        "-port",
        "8889",
        "-env",
        "development"
    };
    dlvToolPath = vim.fn.exepath('/home/d2c-gokulas/go/bin/dlv')  -- Adjust to where delve is installed
  },
}
