# Use the Python 3.7 slim base image
FROM python:3.7-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install Python package
RUN pip install --no-cache-dir naps-track