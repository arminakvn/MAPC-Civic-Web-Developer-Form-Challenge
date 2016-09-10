// Generated by CoffeeScript 1.10.0
(function() {
  var app, cluster, cpuCount, i;

  cluster = require('cluster');

  if (cluster.isMaster) {
    cpuCount = require('os').cpus().length;
    i = 0;
    while (i < cpuCount) {
      cluster.fork();
      i += 1;
    }
    cluster.on('exit', function(worker) {
      console.log('Worker %d died, replacing', worker.id);
      cluster.fork();
    });
  } else {
    app = require('./server/app.js');
    app.app.listen(app.port, function() {
      console.log('Benchmarking worker %d listening on %d', cluster.worker.id, app.port);
    });
  }

}).call(this);
