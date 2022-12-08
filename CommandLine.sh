#!/bin/sh
awk -F, 'BEGIN { FS="," } {if(NR>1){arr[$5]++}} END{ asort(arr, asorted); for(a in arr) {if(arr[a] == asorted[length(asorted)]) print "city with maximum number of purchases ever made:", a, "with", arr[a]} }' bank_transactions.csv
awk -F, 'BEGIN { FS="," } {if(NR>1){arr[$4] = arr[$4] + $9}} END{ asort(arr, asorted); for(a in arr) {if(arr[a] == asorted[length(asorted)]) print "gender who spent the most:", a, "with", arr[a]} }' bank_transactions.csv
awk -F, 'BEGIN { FS="," } {if(NR>1){arr[$2]= arr[$2] + $9; count[$2]++} END{for(a in arr){arr[a]=arr[a]/count[a]} asort(arr, asorted); for(a in arr) {if(arr[a] == asorted[length(asorted)]) print "customer with highest average transaction amount:", a, "with", arr[a]} }' bank_transactions.csv
