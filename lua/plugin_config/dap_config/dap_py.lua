require('dap-python').setup('/home/d2c-gokulas/seaecom/data-aggregator/dagg-venv/bin/python')
require('dap').configurations.python = {
      {
        type = 'debugpy';
	python = '/home/d2c-gokulas/seaecom/data-aggregator/dagg-venv2/bin/python';
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
        type = 'debugpy';
	python = '/home/d2c-gokulas/seaecom/data-aggregator/dagg-venv4/bin/python';
        request = 'launch';
	subProcess = true;
	console = "integratedTerminal";
	module = "celery";
        name = "Celery Worker";
        env = {
          DATA_AGGREGATOR_ENV = "local_orders";
          TENANT = "ind"
        };
        args = {
          "--app=app.worker",
          "--workdir=/home/d2c-gokulas/seaecom/data-aggregator",
          "worker",
          "--pool=solo",
          "--logfile=/home/d2c-gokulas/seaecom/celery_logs/celeryd-worker.log"
        };
        justMyCode = false
      }
    }
