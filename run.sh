#!/bin/bash

#avgChunk=(4096 8192 16384 32768 65536)
#maxChunk=(8192 16384 32768 65536 131072)
avgChunk=(4 16 64)
maxChunk=(8 32 128)
# avgChunk=(8192 16384 32768 65536)
# maxChunk=(16384 32768 65536 131072)
# avgChunk=(4096)
# maxChunk=(8192)
# DedupDIR=("/home/xzjin/backupData/bbcNews/" "/home/xzjin/backupData/gcc" "/home/xzjin/backupData/Paper/")
# DedupDIR=("/home/xzjin/backupData/VMI" "/home/xzjin/backupData/VMB")
#DedupDIR=("/home/xzjin/backupData/bbcNews/" "/home/xzjin/backupData/gcc/" "/home/xzjin/backupData/Paper/" "/home/xzjin/backupData/VMI/" "/home/xzjin/backupData/VMB/")
# DedupDIR=("/home/xzjin/backupData/bbcNews/")
# DedupDIR=("/home/xzjin/backupData/bbcSingleDir/")
DedupDIR=("/home/xzjin/backupData/gcc/")
# DedupDIR=("/home/xzjin/backupData/Paper/")
# DedupDIR=("/home/xzjin/backupData/VMI/")
# DedupDIR=("/home/xzjin/backupData/VMB/")
# DedupDIR=("/home/xzjin/backupData/gcc_part/")
# chunkMethod=("fixed" "rabin" "tttd" "ae" "fastcdc" "gearjump" "leap" )
BackupDir=/home/xzjin/test_destor/data/


for s in "${!avgChunk[@]}"
do
	for dir in "${DedupDIR[@]}"
	do
		chunkAlg="chunk-algorithm $c"
		avgChunkSize="chunk-avg-size ${avgChunk[s]}"
		maxChunkSize="chunk-max-size ${maxChunk[s]}"
		minChunkSize="chunk-min-size 512"
		set -o xtrace
#		/home/xzjin/src/RapidCDC/cdc -c ${avgChunk[s]} -M ${maxChunk[s]} -d $dir -H gear -JB
		/home/xzjin/src/RapidCDC/cdc -c ${avgChunk[s]} -M ${maxChunk[s]} -d $dir -H gear -JB -JC
		set +o xtrace
		echo; echo;
	done
done
