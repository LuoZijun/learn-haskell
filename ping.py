#coding: utf8

import time, subprocess
from   multiprocessing.dummy import Pool as ThreadPool 

pool    = ThreadPool(8)
results = []

def ping(ip):
    cmd = ["ping", "-t", "1", ip]
    r = subprocess.Popen(cmd, stdout=subprocess.PIPE, shell=False, stderr=None)
    #result = r.stdout.read()
    (stdout, stderr) = r.communicate()
    code = r.returncode
    q.append( (ip, code) )
    return True

ips = map( lambda n: "192.168.1.%d" % n, range(1, 251) )

btime = time.time()
print u"开始：", btime 

_     = pool.map(ping, ips)

pool.close()
pool.join()

etime = time.time()
print u"结束：", etime
print results
print u"耗时：", etime-btime
