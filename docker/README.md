## Steps to Build and Push to DockerHub

### 1. Build the Docker Image

Open a terminal in the directory where your Dockerfile is located and run:

```bash
docker build -t yourusername/repo:version -t yourusername/repo:latest .
```

You may need to specify the platform if you are building on a non-Linux system:

```bash
docker build --platform linux/amd64 -t yourusername/repo:latest -t yourusername/repo:latest .
```

Replace `yourusername` with your DockerHub username.

### 2. Login to DockerHub

Log in to your DockerHub account using the command:

```bash
docker login
```

Enter your DockerHub credentials when prompted.

### 3. Push the Image to DockerHub

Once logged in, push the image to DockerHub:

```bash
docker push --all-tags yourusername/repo
```

### 4. Verify the Image on DockerHub

Visit your DockerHub repository and ensure the new image appears there.

## Notes

- Ensure you have Docker installed and running on your machine.
- You may want to customize the Dockerfile further based on your specific use case, such as exposing ports or adding additional dependencies.
- This Dockerfile sets up the environment so that the SLEAP environment is activated by default when you start a container.

##  Example of Building, Tagging, and Pushing at the Same Time

In one command, you can build, tag, and push the Docker image to your DockerHub repository. Open a terminal in the directory where your Dockerfile is located and run the following command:

```bash
docker buildx build --platform linux/amd64 --push -t yourusername/repo:version -t yourusername/repo:latest .
```

`
This command does the following:

- **Builds** the Docker image from your Dockerfile.
- **Tags** the image with the specified tag (`yourusername/repo:latest`).
- **Pushes** the image directly to DockerHub.

Replace `yourusername` with your DockerHub username,`repo` with the repo name, `version` with the version you are pushing.

..note: 
    Login to DockerHub

    Before you can push an image, ensure you are logged in to DockerHub:

    ```bash
    docker login
    ```

    Enter your DockerHub credentials when prompted.

### Verify the Image on DockerHub

Once the command completes, verify that the new image appears in your DockerHub repository.

## Notes

- **Docker Installation**: Ensure Docker is installed and running on your machine.
- **Buildx Support**: Ensure your Docker installation supports `buildx`, which allows cross-platform builds and direct pushes.
- **Credentials**: Be sure to keep your DockerHub credentials secure and never share them in public repositories or scripts.