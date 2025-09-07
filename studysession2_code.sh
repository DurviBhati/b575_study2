

##The code for the 1st problem, calculate the exact ammount of variants 
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v '#' | awk '$4 =="T" && ($5 == "C" || $5 =="G")' | wc -l

##The code to the 2nd problem where are detecting the non SNPs on the 10th chromosome

## here is the first 10
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "#" | awk '$1==10 && (length($4)!=1 || length($5)!=1)' | head -10

## here is the count
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "#" | awk '$1==10 && (length($4)!=1 || length($5)!=1)' | wc -l

## The code to the  3rd question  where we are the  finding variants that are position specific 

## These are the first 10 variants 
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "^#" | awk '($2 > 230000 && $2<730000)' | head

##These are the number of varinats  between the values 
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "^#" | awk '($2 > 230000 && $2<730000)' | wc -l

## To answer the last question about finding variants with a DP > 100 

## We first make a function named filter_dp 
filter_dp() { awk -F'\t' '$0 !~ /^#/{ split($8,info,";"); for(i in info){ if(info[i] ~ /^DP=/){ split(info[i],dp,"="); if(dp[2]>100){ print $1,$2,$4,$5,info[i]; break}}}}' "$1"; }

## To calculate the first 10 from our file 
filter_dp /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | head 

## To calculate the total number of variants
filter_dp /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | wc -l

#####To the next set of problems :
## If we want to just extract the ids and put them in different file: 
cat /mnt/d/UMich/Courses_fall/bioinf575/multi_seq.fa | grep "^>" | sed 's/^>[^|]*|//' > seq_ids.txt

## To filter some lines and tranfer them into other
cat /mnt/d/UMich/Courses_fall/bioinf575/seq_ids.txt | sed -n '1~2p' > seq_ids_selected.txt
