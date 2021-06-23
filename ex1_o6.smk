# suppress expand in rule fastqc, n individual jobs for fastqc

SAMPLES = ["SRR3099585_chr18","SRR3099586_chr18","SRR3099587_chr18"]

rule all:
  input:
    expand("FastQC/{sample}_fastqc.html", sample=SAMPLES),
    "multiqc_report.html"

rule multiqc:
  output:
    "multiqc_report.html"
  input:
    directory("FastQC")
  shell: "multiqc {input}"

rule fastqc:
  output:
    "FastQC/{sample}_fastqc.zip",
    "FastQC/{sample}_fastqc.html"
  input:
    "Data/{sample}.fastq.gz"
  shell: "fastqc --outdir FastQC/ {input}"

