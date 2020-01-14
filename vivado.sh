#!/bin/bash
cd $(dirname $0)
cd EBAZ4205
vivado *.xpr

# run save_bd_design before close project