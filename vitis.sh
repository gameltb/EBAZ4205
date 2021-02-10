#!/bin/bash
cd $(dirname $0)
[ -d SDK ] || mkdir SDK
cd SDK
vitis -workspace .
