FROM mambaorg/micromamba:latest

# Set environment variables to use the SLEAP environment
ENV PATH=/opt/conda/envs/sleap/bin:$PATH
ENV CONDA_DEFAULT_ENV=sleap

# Switch to root user to install OpenGL libraries
USER root

# Install OpenGL libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Switch back to the default user
USER mambauser

# Create a new environment and install SLEAP
RUN micromamba create -y -n sleap -c conda-forge -c nvidia -c sleap -c anaconda sleap && \
    # Clean up all unused packages and caches to reduce image size
    # This removes temporary files created during the installation process
    micromamba clean -afy && \
    # Remove the package cache directory to reduce image size
    # This deletes cached packages that are no longer needed after installation
    rm -rf /opt/conda/pkgs && \
    # Delete static library files (*.a) to save space
    # Static libraries are not necessary for runtime execution
    find /opt/conda/ -type f -name '*.a' -delete && \
    # Delete compiled Python files (*.pyc) to save space
    # Compiled Python files are recreated automatically when the application runs
    find /opt/conda/ -type f -name '*.pyc' -delete && \
    # Delete JavaScript source map files (*.js.map) to save space
    # Source map files are used for debugging and not needed in production
    find /opt/conda/ -type f -name '*.js.map' -delete && \
    # Remove temporary files and caches to save space
    # Cleans up any remaining temporary files in common directories
    rm -rf /tmp/* /var/tmp/*

ENV LD_LIBRARY_PATH=/opt/conda/envs/sleap/lib