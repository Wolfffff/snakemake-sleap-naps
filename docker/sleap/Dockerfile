FROM condaforge/mambaforge:latest

# Set environment variables
ENV PATH /opt/conda/envs/sleap/bin:$PATH
ENV CONDA_DEFAULT_ENV sleap

# Create a new environment and install SLEAP
RUN mamba create -y -n sleap -c conda-forge -c nvidia -c sleap -c anaconda sleap=1.3.3
