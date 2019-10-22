# dockers

Docker Images for Apache HBase 2.x, this image will start an hbase pseudo-distributed mode, primarily for testing purposes.


Apache HBase 2.x Docker 镜像，这个镜像会启动一个hbase伪分布式模式，主要用于测试使用。

# 如何使用
先安装好 Docker，然后在命令行里面使用命令获取本镜像：
```
docker pull iteblog/hbase-docker
```
运行 HBase：
```
docker run iteblog/hbase-docker
```
查看运行状态
```
iteblog@www.iteblog.com:~|⇒  ps -ef|grep hbase
  502 11785  9416   0  9:37上午 ttys003    0:00.12 docker run iteblog/hbase-docker
```
查看 hbase-docker 容器运行的id
```
iteblog@www.iteblog.com:~|⇒  docker ps -a

CONTAINER ID        IMAGE                   COMMAND                   CREATED              STATUS                      PORTS                                                  NAMES
3a4a3fbbaa39        iteblog/hbase-docker    "/bin/sh -c /opt/hba…"    About a minute ago   Up About a minute           2181/tcp, 60000/tcp, 60010/tcp, 60020/tcp, 60030/tcp   suspicious_antonelli
```
可以看到 iteblog/hbase-docker 镜像运行的容器id（CONTAINER ID）为 `3a4a3fbbaa39`。进入容器的 shell 模式：
```
iteblog@www.iteblog.com:~|⇒  docker exec -it 3a4a3fbbaa39 bash

root@3a4a3fbbaa39:/opt/hbase-2.0.6/bin#
```
在里面我们就可以操作 hbase命令了
```
root@3a4a3fbbaa39:/opt/hbase-2.0.6/bin# hbase shell
2019-10-22 01:41:56,909 WARN  [main] util.NativeCodeLoader: Unable to load native-hadoop library for your platform... using builtin-java classes where applicable
HBase Shell
Use "help" to get list of supported commands.
Use "exit" to quit this interactive shell.
For Reference, please visit: http://hbase.apache.org/2.0/book.html#shell
Version 2.0.6, rd65cccb5fda039217954a558c65bda423e0d6df3, Wed Aug 14 15:44:48 UTC 2019
Took 0.0035 seconds
hbase(main):001:0> create 'iteblog', 'a'
Created table iteblog
Took 1.2027 seconds
=> Hbase::Table - iteblog
hbase(main):002:0> list
TABLE
iteblog
1 row(s)
Took 0.0355 seconds
=> ["iteblog"]
hbase(main):003:0> put 'iteblog', '001', 'a:name', 'iteblog'
Took 0.1716 seconds
hbase(main):004:0> put 'iteblog', '001', 'a:blog', 'https://www.iteblog.com'
Took 0.0133 seconds
hbase(main):005:0> scan 'iteblog'
ROW                        COLUMN+CELL
 001                       column=a:blog, timestamp=1571652672209, value=https://www.iteblog.com
 001                       column=a:name, timestamp=1571652658254, value=iteblog
1 row(s)
Took 0.0310 seconds
```
