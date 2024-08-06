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

* **Support for SLURM and Local Execution**:
  - Execute the workflow on both SLURM clusters and local machines using pre-defined profiles, offering flexibility in different computing environments.

* **Concurrent Processing**:
  - Processes multiple video files and projects concurrently, optimizing computational resources and reducing processing time.

* **Integration with SLEAP and NAPS**:
  - Seamlessly integrates SLEAP for pose estimation and NAPS for identity persistence.


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

This workflow is managed by Snakemake, a popular workflow management system. The main workflow file is located at ``workflow/Snakefile``. To execute the pipeline, navigate to your project directory and run:

.. code-block:: bash

    snakemake --workflow-profile profiles/local_conda

This command will process all configured projects concurrently, handling each video file format specified in the configuration file.

Profiles and Execution
**********************

This workflow supports execution using Snakemake profiles. Profiles are configuration files that allow you to customize the execution environment, including the use of computing backends like SLURM.

You can find example profiles under ``profiles/{NAME}`` in the repository. To run the workflow with a specific profile, use the following command:

.. code-block:: bash

    snakemake --workflow-profile profiles/{NAME} --snakefile workflow/Snakefile

For example, to run on a SLURM cluster, ensure your SLURM profile is configured and execute:

.. code-block:: bash

    snakemake --workflow-profile profiles/slurm_singularity --snakefile workflow/Snakefile

For more information about configuring profiles, see the `Snakemake documentation <https://snakemake.readthedocs.io/en/stable/executing/cli.html#profiles>`_.

Snakemake and Version Notes
***************************

This workflow is built using `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_, a Python-based workflow management system that enables reproducibility and scalability. This documentation assumes knowledge of Snakemake version 8, which includes several enhancements and best practices, such as encapsulating rules with the ``workflow`` directive for better organization.

For more details on Snakemake v8, see the `release notes <https://snakemake.readthedocs.io/en/v8.16.0/>`_.

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