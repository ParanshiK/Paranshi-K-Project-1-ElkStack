#!/bin/bash

grep -i '$1_Dealer_FNAME LAST' $2_Dealer_schedule
awk -F" " '{print $1, $2, $5, $6}' $2_Dealer_schedule | grep -E $3

