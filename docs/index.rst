.. _index:

Snakemake Workflow for SLEAP + NAPS
===================================

.. |Stable version| image:: https://img.shields.io/github/v/release/wolfffff/snakemake-sleap-naps?label=stable
   :target: https://github.com/wolfffff/snakemake-sleap-naps/releases/
   :alt: Stable version

.. |Latest version| image:: https://img.shields.io/github/v/release/wolfffff/snakemake-sleap-naps?include_prereleases&label=latest
   :target: https://github.com/wolfffff/snakemake-sleap-naps/releases/
   :alt: Latest version

.. |Documentation| image:: https://readthedocs.org/projects/naps/badge/?version=latest
   :target: https://naps.readthedocs.io/en/latest/?badge=latest
   :alt: Documentation Status

.. |github ci| image:: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/ci.yml/badge.svg?branch=main
   :target: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/ci.yml
   :alt: Continuous integration status

.. |Coverage| image:: https://codecov.io/gh/wolfffff/snakemake-sleap-naps/branch/main/graph/badge.svg
   :target: https://codecov.io/gh/wolfffff/snakemake-sleap-naps
   :alt: Coverage

.. |conda| image:: https://anaconda.org/wolfffff/snakemake-sleap-naps-track/badges/version.svg
   :target: https://anaconda.org/wolfffff/snakemake-sleap-naps-track

.. |Conda Upload| image:: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/upload_conda.yml/badge.svg
   :target: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/upload_conda.yml

.. |PyPI Upload| image:: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/python-publish.yml/badge.svg
   :target: https://github.com/wolfffff/snakemake-sleap-naps/actions/workflows/python-publish.yml

.. |LICENSE| image:: https://anaconda.org/wolfffff/snakemake-sleap-naps-track/badges/license.svg
   :target: https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md

.. toctree::
   :maxdepth: 2
   :caption: Contents:

   self
   tutorial
   contact

Overview
--------

The **Snakemake Workflow for SLEAP + NAPS** integrates two powerful tools to facilitate advanced animal behavior research. This workflow is designed for researchers aiming to quantify animal behavior with high accuracy and minimal bias, and to track individual behavior persistently.

What is NAPS?
-------------

NAPS (Neuro-Analysis of Pose and Social behavior) is a tool for researchers with two primary goals:

1. **Quantitative Behavioral Analysis**: Measure animal behavior over long timescales and high resolutions while minimizing human bias.
2. **Individual Identity Tracking**: Maintain identity-persistence in tracking the behavior of individuals, useful for social network analysis, animal communication, task specialization, and gene-environment interaction studies.

This tool combines deep-learning-based pose estimation software with easily identifiable and minimally invasive fiducial markers ("tags") to produce high-quality, high-dimensional behavioral data.

Features
--------

* Cross-Platform Installation: Easy installation on Windows and Linux.
* Integration with OpenCV and SLEAP: Built directly on top of `OpenCV <https://opencv.org/>`_ and `SLEAP <https://sleap.ai/>`_ for robust image and video processing.
* Modular and Extensible: Designed to be modular, allowing easy integration of different methods for marker identification.
* Flexible API: Supports the integration of various techniques for customized analysis.

Getting Started
---------------

Installation
************

Recommended: Conda

To set up the environment using Conda, which simplifies the installation of all dependencies:

.. code-block:: bash

    mamba env create -f conda.yml

.. caution::

    This is the recommended installation method.

Running the Workflow
********************

This workflow is managed by Snakemake, a popular workflow management system. The main workflow file is located at ``workflow/Snakefile``. To execute the pipeline, navigate to your project directory and run:

.. code-block:: bash

    snakemake --cores <number_of_cores> --use-conda --snakefile workflow/Snakefile

Replace ``<number_of_cores>`` with the number of CPU cores you wish to utilize. This command will process all configured projects concurrently, handling each video file format specified in the configuration file.

Profiles and Execution
**********************

This workflow supports execution using Snakemake profiles. Profiles are configuration files that allow you to customize the execution environment, including the use of computing backends like SLURM.

You can find example profiles under ``profiles/{NAME}`` in the repository. To run the workflow with a specific profile, use the following command:

.. code-block:: bash

    snakemake --profile profiles/{NAME} --snakefile workflow/Snakefile

For example, to run on a SLURM cluster, ensure your SLURM profile is configured and execute:

.. code-block:: bash

    snakemake --profile profiles/slurm --snakefile workflow/Snakefile

For more information about configuring profiles, see the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles>`_.

Snakemake and Version Notes
***************************

This workflow is built using `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_, a Python-based workflow management system that enables reproducibility and scalability. This documentation assumes knowledge of Snakemake version 8, which includes several enhancements and best practices, such as encapsulating rules with the ``workflow`` directive for better organization.

For more details on Snakemake v8, see the `release notes <https://snakemake.readthedocs.io/en/stable/project_info/history.html>`_.

Issues
------

1. **Check the Documentation**: Always consult the documentation for troubleshooting common issues.
2. **GitHub Issues**: Search or open a new issue on the `GitHub issues page <https://github.com/wolfffff/snakemake-sleap-naps/issues>`_.

Contributors
------------

* **Scott Wolf**: Lewis-Sigler Institute for Integrative Genomics, Princeton University
* **Sarah Kocher**: Department of Ecology and Evolutionary Biology and Lewis-Sigler Institute for Integrative Genomics, Princeton University

This workflow was created in the `Kocher Lab <https://kocherlab.princeton.edu/>`_.

License
-------

NAPS is licensed under the MIT license. For details, see the `LICENSE <https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md>`_ file.

Acknowledgements
----------------

The structure and content of this README and the documentation draw inspiration from the `SLEAP repository <https://github.com/talmolab/sleap>`_.