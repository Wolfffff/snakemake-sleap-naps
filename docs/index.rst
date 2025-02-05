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

The **Snakemake Workflow for SLEAP and NAPS** leverages the capabilities of both SLEAP and NAPS to quickly capture pose and persist identity.

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

Git Clone
*********

First, clone the GitHub repository to your machine and navigate to the project directory:

.. code-block:: bash

    git clone https://github.com/Wolfffff/snakemake-sleap-naps.git && cd snakemake-sleap-naps


Setting Up Your Environment
***************************

To set up an environment with Snakemake using Mamba, run the following command:

.. code-block:: bash

    mamba env create -f conda.yml


Running the Workflow
********************

This workflow is managed by Snakemake. The main workflow file is located at `workflow/Snakefile`. To execute the pipeline, navigate to your project directory and run:

.. code-block:: bash

    snakemake --workflow-profile profiles/local_conda

This command will process all configured projects concurrently, handling each video file format specified in the configuration file.

Profiles and Execution
**********************

You can find example profiles under profiles/{NAME}` in the repository which allow you to customize the execution environment. To run the workflow with a specific profile, use the following command:

.. code-block:: bash

    snakemake --workflow-profile profiles/{NAME}

For example, to run on a SLURM cluster using Singularity, ensure your SLURM profile is configured and execute:

.. code-block:: bash

    snakemake --workflow-profile profiles/slurm_singularity


Inspecting the Results
***********************

The results of the workflow will be saved in the `project_1/`.

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

The Snakemake-SLEAP-NAPS workflow is licensed under the MIT license. For details, see the `LICENSE <https://github.com/wolfffff/snakemake-sleap-naps/blob/main/LICENSE.md>`_ file.
