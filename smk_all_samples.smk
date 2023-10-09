SAMPLES, = glob_wildcards(config["dataDir"]+"{sample}.fastq.gz")

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
  conda:
    "envs/multiqc-1.12.yml"
  container:
    "https://depot.galaxyproject.org/singularity/multiqc:1.10.1--pyhdfd78af_1"
  envmodules:
    "multiqc/1.12"
  shell: "multiqc {input} 1>{log.std} 2>{log.err}" 

rule fastqc:
  output:
    "FastQC/{sample}_fastqc.zip",
    "FastQC/{sample}_fastqc.html"
  input:
    config["dataDir"]+"{sample}.fastq.gz"
  log:
    std="Logs/{sample}_fastqc.std",
    err="Logs/{sample}_fastqc.err"
  conda:
    "envs/fastqc-0.11.9.yml"
  container:
     "docker://biocontainers/fastqc:v0.11.9_cv8"
  envmodules:
    "fastqc/0.11.9"
  shell: "fastqc --outdir FastQC/ {input} 1>{log.std} 2>{log.err}"

