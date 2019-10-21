#! /bin/bash

wget http://archive.apache.org/dist/hbase/$HBASE_VERSION/hbase-$HBASE_VERSION-bin.tar.gz
tar xzf hbase-$HBASE_VERSION-bin.tar.gz -C /opt/
ln -s /opt/hbase-$HBASE_VERSION /opt/hbase

rm hbase-$HBASE_VERSION-bin.tar.gz
