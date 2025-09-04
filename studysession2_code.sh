

##The code for the 1st problem, calculate the exact ammount of variants 
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v '#' | awk '$4 =="T" && ($5 == "C" || $5 =="G")' | wc -l

##The code to the 2nd problem where are detecting the non SNPs on the 10th chromosome

## here is the first 10
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "#" | awk '$1==10 && (length($4)!=1 || length($5)!=1)' | head -10

## here is the count
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v "#" | awk '$1==10 && (length($4)!=1 || length($5)!=1)' | wc -l
