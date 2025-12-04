#!/bin/sh
/usr/local/bin/PlistExplorer "$1" >tmp_file1
/usr/local/bin/PlistExplorer "$2" >tmp_file2
bbdiff --ignore-leading-spaces tmp_file1 tmp_file2
