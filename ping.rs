extern crate time;

use std::process::Command;
use std::process::ExitStatus;
// use std::sync::{Arc, Mutex};
use std::sync::mpsc;
use std::thread;

/*
Cargo.toml

[package]
name = "ping"
version = "0.1.0"
authors = ["Me <test@test.com>"]

[dependencies]
time="0.1.34"

*/

fn timestamp () -> f64 {
    // let tm = time::now();
    let timespec = time::get_time();
    // 1459440009.113178
    let mills: f64 = timespec.sec as f64 + (timespec.nsec as f64 / 1000.0 / 1000.0 / 1000.0 );
    mills
}

fn ping (ip: String) -> (String, ExitStatus) {
    let output = Command::new("ping").arg("-t").arg("1").arg(ip.to_string()).output().unwrap_or_else(|e| {
            panic!("failed to execute process: {}", e)
    });
    let status = output.status;
    (ip.to_string(), status)
}

fn main (){
    let ips: Vec<String> = (1..251).collect::<Vec<i32>>().iter()
                            .map( |&n: &i32| {
                                    // 172.17.42.1
                                    let mut ip = "192.168.1.".to_string(); 
                                    ip.push_str( &n.to_string() );
                                    ip
                            }).collect();

    let (tx, rx) = mpsc::channel();
    let mut results: Vec<(String, ExitStatus)> = Vec::new();

    let btime = timestamp();
    println!("开始： {:?}", btime );

    for ip in ips.clone() {
        let tx = tx.clone();
        thread::spawn(move || {
            let r = ping(ip);
            tx.send(r).unwrap();
        });
    }

    
    for _ in ips.clone() {
        results.push(rx.recv().unwrap());
    }
    let etime = timestamp();
    println!("结束： {:?}", etime );
    println!("{:?}", results );
    println!("耗时：{:?}", etime-btime );

}
