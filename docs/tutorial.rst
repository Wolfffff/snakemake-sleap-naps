.. _tutorial:

Tutorial and Configuration
==========================

This section provides detailed instructions on setting up and configuring the Snakemake Workflow for SLEAP + NAPS.

Prerequisites
-------------

Before running the workflow, ensure you have installed:

- `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_
- `Conda <https://docs.conda.io/en/latest/>`_ or `Mamba <https://mamba.readthedocs.io/en/latest/>`_
- Access to your data files in the appropriate format (e.g., `.mp4`, `.avi`, etc.)

Setting Up Your Environment
---------------------------

1. **Clone the Repository**

   First, clone the GitHub repository to your local machine:

   .. code-block:: bash

      git clone https://github.com/wolfffff/snakemake-sleap-naps.git
      cd snakemake-sleap-naps

2. **Create a Conda Environment**

   Create a Conda environment using the provided `conda.yml` file:

   .. code-block:: bash

      mamba env create -f conda.yml

   Activate the environment:

   .. code-block:: bash

      conda activate snakemake-sleap-naps

Configuring Your Workflow
-------------------------

The main configuration file is `config.yaml`, located in the root directory. This file specifies the details for each project, including input directories, file extensions, output directories, model configurations, and options for SLEAP and NAPS.

Here is an example of a typical configuration setup:

.. code-block:: yaml

   project_configs:
     project_1:
       videos:
         input_dir: "path/to/videos/project_1"
         file_extensions: [".mp4", ".avi"]
       output_dir: "output"
       model_configs:
         centroid_model: "path/to/centroid_model"
         centered_instance_model: "path/to/centered_instance_model"
       frames_per_second: 20
       sleap_options:
         --batch-size: 4
         --tracking-method: "tracking"
         --peak-threshold: 0.3
       naps_options:
         --confidence-threshold: 0.6
         --tag-node-name: "tag"
         --start-frame: 0
         --end-frame: 1200
         --aruco-marker-set: "DICT_5X5_50"
         --aruco-crop-size: 50
         --aruco-error-correction-rate: 0.6
         --aruco-adaptive-thresh-constant: 7
         --aruco-adaptive-thresh-win-size-max: 23
         --aruco-adaptive-thresh-win-size-step: 10
         --aruco-adaptive-thresh-win-size-min: 3
         --half-rolling-window-size: 20

Executing the Workflow
----------------------

To run the workflow, ensure that your terminal is in the root directory of the repository. Use the following command:

.. code-block:: bash

   snakemake --cores <number_of_cores> --use-conda --snakefile workflow/Snakefile

For distributed computing environments, you can use Snakemake profiles to customize execution:

- **Local execution**:

  .. code-block:: bash

     snakemake --cores 4 --use-conda --snakefile workflow/Snakefile

- **SLURM execution**:

  Ensure your SLURM profile is configured in `profiles/slurm` and run:

  .. code-block:: bash

     snakemake --profile profiles/slurm --snakefile workflow/Snakefile

Understanding the Workflow
--------------------------

The workflow consists of two primary components:

1. **SLEAP**: Utilizes deep-learning models to perform pose estimation on animal videos.
2. **NAPS**: Analyzes the pose data to quantify behavior and track individual animals.

Both components are highly configurable through `config.yaml`, allowing you to tailor the workflow to your specific research needs.

Troubleshooting
---------------

- **Check Dependencies**: Ensure all dependencies are installed via the Conda environment.
- **Configuration Errors**: Double-check your `config.yaml` for any typos or incorrect paths.
- **Snakemake Logs**: Review Snakemake logs