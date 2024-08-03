## Steps to Build and Push to DockerHub

### 1. Build the Docker Image

Open a terminal in the directory where your Dockerfile is located and run:

```bash
docker build -t yourusername/sleap:1.3.3 .
```

You may need to specify the platform if you are building on a non-Linux system:

```bash
docker build --platform linux/amd64 -t yourusername/sleap:1.3.3 .
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
docker push yourusername/sleap:1.3.3
```

### 4. Verify the Image on DockerHub

Visit your DockerHub repository and ensure the new image appears there.

## Notes

- Ensure you have Docker installed and running on your machine.
- You may want to customize the Dockerfile further based on your specific use case, such as exposing ports or adding additional dependencies.
- This Dockerfile sets up the environment so that the SLEAP environment is activated by default when you start a container.