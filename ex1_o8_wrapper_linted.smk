configfile: "config.ex1_o8_wrapper_linted.yaml"


# Require samples to be in configuration
SAMPLES = config["samples"]

# Set a default value
datadir = config.get("datadir", "Data")


# The main rule because it is the first one.
# Name this rule as you want. Historically,
# it was called "all", but since "all" is a
# keyword in python, we prefer the name "target"
rule target:
    input:
        expand("FastQC/{sample}_fastqc.html", sample=SAMPLES),
        "multiqc_report.html",


# This rule installs MultiQC using mamba
# then builds the command line for you
rule multiqc:
    input:
        expand("FastQC/{sample}_fastqc.zip", sample=SAMPLES),
    output:
        protected("multiqc_report.html"),
    log:
        "Logs/multiqc.err",
    threads: 1
    wrapper:
        "v2.6.0/bio/multiqc"


# This rule installs FastQC using mamba
# then builds the command line for you
rule fastqc:
    input:
        expand("{datadir}/{sample}.fastq.gz", datadir=[datadir], allow_missing=True),
    output:
        html=temp("FastQC/{sample}_fastqc.html"),
        zip="FastQC/{sample}_fastqc.zip",
    log:
        "Logs/fastqc/{sample}.err",
    params:
        # Additional parameters for FastQC, totally optional
        exta="--quiet",
    threads: 1
    resources:
        # With "resources", you can suit up the size
        # of the java machine, a nice memory saver!
        mem_mb=1024,
    wrapper:
        "v2.6.0/bio/fastqc"
