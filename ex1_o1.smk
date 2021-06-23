# the rule concept, 1 input


















rule fastqc:
  output:
    "FastQC/SRR3099585_chr18_fastqc.zip", 
    "FastQC/SRR3099585_chr18_fastqc.html"
  input:
    "Data/SRR3099585_chr18.fastq.gz"
  shell: "fastqc --outdir FastQC/ {input}"

