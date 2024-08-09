.. _tutorial:

Tutorial
==========================

This section provides detailed instructions on setting up and configuring the Snakemake Workflow for SLEAP + NAPS.

Prerequisites
-------------

Before running the workflow, ensure you have installed:

- `Snakemake <https://snakemake.readthedocs.io/en/stable/>`_
- `Conda <https://docs.conda.io/en/latest/>`_ or `Mamba <https://mamba.readthedocs.io/en/latest/>`_
- Access to your data files in the appropriate format (e.g., `mp4`, `avi`, etc.)


.. note::

   You should have mamba installed or use `--conda-frontend conda`` when calling snakemake.

Setting Up Your Environment
---------------------------

1. **Clone the Repository**

   First, clone the GitHub repository to your local machine:

   .. code-block:: bash

      git clone https://github.com/wolfffff/snakemake-sleap-naps.git && cd snakemake-sleap-naps

1. **Create a Conda Environment**

   Create a Conda environment using the provided `conda.yml` file:

   .. code-block:: bash

      mamba env create -f conda.yml

   Activate the environment:

   .. code-block:: bash

      mamba activate smk

Configuring Your Workflow
-------------------------

The main configuration file is `config.yaml`, located in the root directory. This file specifies the details for each project, including input directories, file extensions, output directories, model configurations, and options for SLEAP and NAPS.

.. warning::

   This workflow parallelizes across videos, so make sure you split large videos if necessary. The following code uses `FFmpeg <https://www.ffmpeg.org/>`_ to split a video into 1-hour segments:
   
   .. code-block:: bash

      ffmpeg -i input.mp4 -c:v copy -segment_time 01:00:00 -f segment output_%04d.mp4


Here is an example of a typical configuration setup:

.. code-block:: yaml

  project_configs:
    project_1:
      videos:
        input_dir: "tests/data/videos"
        file_extensions: ["mp4", "avi"]
      output_dir: "output"
      model_configs:
        centroid_model: "tests/data/models/centroid"
        centered_instance_model: "tests/data/models/centered_instance"
      frames_per_second: 20
      sleap_options:
        --batch-size: 4
        --tracking.tracker: simplemaxtracks
        --tracking.max_tracking: 1
        --tracking.max_tracks: 16
      naps_options:
        --start-frame: 0
        --end-frame: 1200
        --aruco-marker-set: "DICT_5X5_50"
        --tag-node-name: "tag"
        --aruco-crop-size: 50
        --aruco-error-correction-rate: 0.6
        --aruco-adaptive-thresh-constant: 7
        --aruco-adaptive-thresh-win-size-max: 23
        --aruco-adaptive-thresh-win-size-step: 10
        --aruco-adaptive-thresh-win-size-min: 3
        --half-rolling-window-size: 20
      aruco_tag_set:
          tags: [5, 6, 7, 8]

Configuring resources
---------------------

The workflow can be configured to run on different computing environments using Snakemake profiles. The profiles are defined in the `profiles` directory and include options for local and SLURM execution with Conda and Singularity containers.

Executing the Workflow
----------------------

To run the workflow, ensure that your terminal is in the root directory of the repository. Use the following command:

.. warning::

   Using the example workflow currently requires you to download the SLEAP model for centroid tracking from the `here <https://drive.google.com/file/d/1BrA-MHWbaaG-az4UwfgkIE6eN42OyMvr/view?usp=sharing>`_ and place it in `tests/data/models/centroid`.

.. code-block:: bash

   snakemake --workflow-profile profiles/local_conda


For distributed computing environments, you can use Snakemake profiles to customize execution:

- **SLURM execution**:

  Ensure your SLURM profile is configured in `profiles/slurm_singularity` and run:

  .. code-block:: bash

     snakemake --workflow-profile profiles/slurm_singularity


.. note::

   Note: The workflow supports four execution options: local_conda, local_singularity, slurm_conda, and slurm_singularity. Check the `docker/` folder for information about the containers used for Singularity.

Troubleshooting
---------------

- **Configuration Errors**: Double-check your `config.yaml` for any typos or incorrect paths.
- **Snakemake Logs**: Review Snakemake logs under the `.snakemake` directory.
- **GitHub Issues**: Search or open a new issue on the `GitHub issues page <https://github.com/wolfffff/snakemake-sleap-naps/issues>`_.
