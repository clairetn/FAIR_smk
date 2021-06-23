# add log

SAMPLES = ["SRR3099585_chr18","SRR3099586_chr18","SRR3099587_chr18"]

rule all:
  input:
    expand("FastQC/{sample}_fastqc.html", sample=SAMPLES),
    "multiqc_report.html"

rule multiqc:
  output:
    "multiqc_report.html"
  input:
    expand("FastQC/{sample}_fastqc.zip", sample = SAMPLES)
  log:
    std="Logs/multiqc.std",
    err="Logs/multiqc.err"
  shell: "multiqc {input} 1>{log.std} 2>{log.err}" 

rule fastqc:
  output:
    "FastQC/{sample}_fastqc.zip",
    "FastQC/{sample}_fastqc.html"
  input:
    "Data/{sample}.fastq.gz"
  log:
    std="Logs/{sample}_fastqc.std",
    err="Logs/{sample}_fastqc.err"
  shell: "fastqc --outdir FastQC/ {input} 1>{log.std} 2>{log.err}"

