for i in `cat ~/FYP/Preprocess/Raw/R1_list`; do for j in `cat ~/FYP/Preprocess/Raw/R2_list`;do \
 fastp --in1 ~/FYP/Preprocess/Raw/${i}.fastq.gz \
 --in2 ~/FYP/Preprocess/Raw/${j}.fastq.gz \
 --out1 ~/FYP/Preprocess/Clean/${i}.fastq.gz\
 --out2 ~/FYP/Preprocess/Clean/${j}.fastq.gz \
 --detect_adapter_for_pe \
 --dedup\
 --length_required 100
 ;done done