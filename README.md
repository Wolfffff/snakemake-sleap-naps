[![Stable Version](https://img.shields.io/github/v/release/wolfffff/snakemake-sleap-naps?label=stable)](https://github.com/wolfffff/snakemake-sleap-naps/releases/)
[![Latest Version](https://img.shields.io/github/v/release/wolfffff/snakemake-sleap-naps?include_prereleases&label=latest)](https://github.com/wolfffff/snakemake-sleap-naps/releases/)
[![Documentation Status](https://readthedocs.org/projects/snakemake-sleap-naps/badge/?version=latest)](https://snakemake-sleap-naps.readthedocs.io/en/latest/?badge=latest)
[![LICENSE](https://img.shields.io/github/license/wolfffff/snakemake-sleap-naps)](https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md)

# Snakemake Workflow for SLEAP and NAPS

A simple Snakemake workflow for orchestrating the use of SLEAP for pose estimation and NAPS for identity persistence.


## Features

- Simple configuration via `config.yaml`.
- Supports SLURM and local execution.
- Processes multiple video files concurrently simply by pointing to a folder.

## Installation

```bash
    mamba env create -f conda.yml
```

## Usage

> **Warning**
> 
> Using the example workflow currently requires you to download the SLEAP model for centroid tracking from [here](https://drive.google.com/file/d/1BrA-MHWbaaG-az4UwfgkIE6eN42OyMvr/view?usp=sharing) and place it in `tests/data/models/centroid`.

Run the workflow with:

```bash
    snakemake --workflow-profile profiles/local_conda
```

## Documentation

For detailed documentation, visit [snakemake-sleap-naps.readthedocs.io](https://snakemake-sleap-naps.readthedocs.io/en/latest/).


## Issues / Support

Check [GitHub issues](https://github.com/wolfffff/snakemake-sleap-naps/issues) for support.

## Contributors

- Scott Wolf, Princeton University
- Sarah Kocher, Princeton University

## References

- SLEAP: [https://sleap.ai/](https://sleap.ai/)
- NAPS: [https://naps.readthedocs.io/en/latest/](https://naps.readthedocs.io/en/latest/)

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](https://github.com/wolfffff/snakemake-sleap-naps/blob/main/CONTRIBUTING.md) for more information.

## License

Licensed under the MIT license. See [LICENSE](https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md).