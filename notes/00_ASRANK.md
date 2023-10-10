### Running the docker container

You can build the docker image from the docker file as follows:

```bash
    docker build -t research/toposcope .
```
To run the image `interactively` with a mounted folder as a volume,just do:

```bash
    docker run -it --rm -v /path/to/folder:/mnt/data research/toposcope
```
This command will start a Docker container and mount the specified folder as a volume at `/mnt/data` inside the container. The `--rm` flag ensures that the container is removed when you exit it.

You can now interact with the Docker container as if you were working directly on your local machine. When you're done, exit the container by typing `exit` or pressing `Ctrl-D`.
cd /home/martin/Developer/projects/TopoScope/
