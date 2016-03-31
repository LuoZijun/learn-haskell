#!/usr/bin/env node

const spawn = require('child_process').spawn;

function range(start, stop, step) {
    if (typeof stop == 'undefined') {
        // one param defined
        stop = start;
        start = 0;
    }
    if (typeof step == 'undefined') step = 1;
    if ((step > 0 && start >= stop) || (step < 0 && start <= stop)) return [];
    var result = [];
    for (var i = start; step > 0 ? i < stop : i > stop; i += step) {
        result.push(i);
    }
    return result;
};

const ips    = range(1, 251).map(function (n){ return "192.168.1."+n });
const result = []

function ping (ip) {
    var command = spawn('ping', ['-t', '1', ip]);
    command.on('close', function (code, signal){
        result.push( [ip, code] );
        if ( result.length == ips.length ) {
            const etime = new Date().getTime() / 1000;
            console.log("结束：", etime);

            console.log(result);
            console.log("耗时：", etime-btime);
        }
        
    });
    // command.kill('SIGHUP');
}

const btime = new Date().getTime() / 1000;
console.log("开始：", btime);

ips.forEach(ping);

// function wait (){
//     if ( result.length != ips.length ) {
//         setTimeout(wait, 1);
//     }
// }
// wait();

