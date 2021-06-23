# 2 rules, no link

SAMPLES = ["SRR3099585_chr18","SRR3099586_chr18","SRR3099587_chr18"]








rule multiqc:
  output:
    "multiqc_report.html",
    directory("multiqc_data")
  input:
    expand("FastQC/{sample}_fastqc.zip", sample = SAMPLES)
  shell: "multiqc {input}"

rule fastqc:
  output:
    expand("FastQC/{sample}_fastqc.zip", sample = SAMPLES),
    expand("FastQC/{sample}_fastqc.html", sample = SAMPLES)
  input:
    expand("Data/{sample}.fastq.gz", sample = SAMPLES)
  shell: "fastqc --outdir FastQC/ {input}"

