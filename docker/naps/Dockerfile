FROM condaforge/mambaforge:latest

# Set environment variables
ENV PATH /opt/conda/envs/naps/bin:$PATH
ENV CONDA_DEFAULT_ENV naps

# Create a new environment and install NAPS
RUN mamba create -y -n naps -c conda-forge -c nvidia -c kocherlab -c anaconda naps-track
