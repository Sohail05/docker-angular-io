# Use an official node runtime as a base image
FROM node:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get upgrade -y && \
    npm install -g @angular/cli karma-cli

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
#ENV App World

# Run ng serve when the container launches
#CMD ["ng", "serve"]
