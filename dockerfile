# Use Ubuntu 20.04 as the base image
FROM ubuntu:18.04

# Update the package list and install Python and pip
RUN apt-get update && \
    apt-get install -y python python-pip python3-pip && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
# Copy the requirements file to the container
COPY requirements.txt .


# Install the Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash"]