# IFB FAIR bioinfo training - SnakeMake workflow

Use during the [IFB FAIR bioinfo training](https://ifb-elixirfr.github.io/IFB-FAIR-bioinfo-training/index.html#home)

## Dataset

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.3997237.svg)](https://doi.org/10.5281/zenodo.3997237)

```bash
wget -O FAIR_Bioinfo_data.tar.gz https://zenodo.org/record/3997237/files/FAIR_Bioinfo_data.tar.gz?download=1
```

## Exercices

### ex1_o8 - Integrated Package Management

Snakemake documentation: [Integrated Package Management](https://snakemake.readthedocs.io/en/stable/snakefiles/deployment.html#integrated-package-management)

#### `--use-conda`

```bash
module load snakemake slurm-drmaa conda
snakemake --drmaa --jobs=4 -s ex1_o8.smk --use-conda
```

#### `--use-singularity`

```bash
module load snakemake slurm-drmaa singularity
snakemake --drmaa --jobs=4 -s ex1_o8.smk --use-singularity
```

#### `--use-envmodule`

```bash
module load snakemake slurm-drmaa 
snakemake --drmaa --jobs=4 -s ex1_o8.smk --use-envmodule
```


