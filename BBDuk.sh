#!/bin/bash

#mkdir -p hg_trimmed_test

for samples in `cat samples_list`;do

~/Tools/BBMap/bbduk.sh \
        -Xmx50g \
        in=./${samples}_1.fastq.gz \
        in2=./${samples}_2.fastq.gz \
        out=hg_trim1/${samples}_1.fastq.gz \
        out2=hg_trim1/${samples}_2.fastq.gz \
        ref=~/Databases/hg38/GRCh38_latest_genomic.fna \
        k=31 \
        prealloc=t \
        threads=60
done


