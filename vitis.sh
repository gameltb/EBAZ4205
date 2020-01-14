#!/bin/bash
cd $(dirname $0)
[ -d vitis ] || mkdir vitis
cd vitis
vitis -workspace .