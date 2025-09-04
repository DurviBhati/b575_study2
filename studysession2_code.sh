

##The code for the 1st problem, calculate the exact ammount of variants 
cat /mnt/d/UMich/Courses_fall/bioinf575/gsm_data.txt | grep -v '#' | awk '$4 =="T" && ($5 == "C" || $5 =="G")' | wc -l

