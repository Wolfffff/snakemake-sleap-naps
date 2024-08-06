.. _index:

Homepage
========

.. toctree::
   :maxdepth: 1
   :caption: Snakemake Workflow for SLEAP + NAPS

   self
   tutorial
   contact

Overview
--------

The **Snakemake Workflow for SLEAP + NAPS** is a powerful tool for advanced animal behavior research, leveraging the capabilities of both SLEAP and NAPS. It enables efficient data processing for pose estimation and behavioral analysis using:

- **SLEAP**: For deep-learning-based pose estimation of animal videos.
- **NAPS**: For identity persistence using fiducial markers.

This workflow supports simple configuration and can be executed using different profiles, including support for SLURM and local execution.

Features
--------

* **Simple Configuration**:
  - Easily configurable through a single `config.yaml` file, allowing users to specify project details, including arguments for SLEAP and NAPS.

* **Concurrent Processing**:
  - Processes multiple video files and projects concurrently, both locally and through SLURM cluster.

* **Flexible Execution Profiles**:
  - Includes profiles for `local_conda`, `local_singularity`, `slurm_conda`, and `slurm_singularity`, allowing users to choose their preferred execution environment.


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

This workflow is managed by Snakemake. The main workflow file is located at ``workflow/Snakefile``. To execute the pipeline, navigate to your project directory and run:

.. code-block:: bash

    snakemake --workflow-profile profiles/local_conda

This command will process all configured projects concurrently, handling each video file format specified in the configuration file.

Profiles and Execution
**********************

You can find example profiles under ``profiles/{NAME}`` in the repository which allow you to customize the execution environment. To run the workflow with a specific profile, use the following command:

.. code-block:: bash

    snakemake --workflow-profile profiles/{NAME} --snakefile workflow/Snakefile

For example, to run on a SLURM cluster using Singularity, ensure your SLURM profile is configured and execute:

.. code-block:: bash

    snakemake --workflow-profile profiles/slurm_singularity --snakefile workflow/Snakefile

For more information about configuring profiles, see the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles>`_.

Issues
------

**GitHub Issues**: Search or open a new issue on the `GitHub issues page <https://github.com/wolfffff/snakemake-sleap-naps/issues>`_.

Contributors
------------

* **Scott Wolf**: Lewis-Sigler Institute for Integrative Genomics, Princeton University
* **Sarah Kocher**: Department of Ecology and Evolutionary Biology and Lewis-Sigler Institute for Integrative Genomics, Princeton University

This workflow was created in the `Kocher Lab <https://kocherlab.princeton.edu/>`_.

License
-------

NAPS is licensed under the MIT license. For details, see the `LICENSE <https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md>`_ file.
