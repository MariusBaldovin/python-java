# using ubuntu 22.04 image 
FROM ubuntu:22.04

# Installing python and java packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

# Settting the default Python version to python3
RUN ln -s /usr/bin/python3 /usr/bin/python

# Copy Python script and Java source code
COPY script.py /app/script.py
COPY Main.java /app/Main.java

# Compile Java code 
RUN javac /app/Main.java

# Set working directory
WORKDIR /app

# Default command to execute when container starts
CMD ["bash", "-c", "python script.py && java Main "]
