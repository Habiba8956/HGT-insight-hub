input_folder="/mnt/d/FYP/6.Amphora2/VD_megahit_assembly/"

for sample_num in {476..916}; do
		input_file="SRR7217${sample_num}.fa"
	       	perl ~/AMPHORA2/Scripts/MarkerScanner.pl -Bacteria -DNA "${input_folder}/${input_file}"
done
perl ~/AMPHORA2/Scripts/MarkerAlignTrim.pl -WithReference -OutputFormat phylip
perl ~/AMPHORA2/Scripts/Phylotyping.pl -CPUs 6 > /mnt/d/FYP/6.Amphora2/VD_megahit_phylotype/VD_megahit_phylotype.txt
