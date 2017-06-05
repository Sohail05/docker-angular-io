# Use an official node runtime as a base image
FROM ubuntu:latest

# Make use of -y -q in conjuction to avoid user interaction prompts
ENV DEBIAN_FRONTEND noninteractive

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN apt-get update -q && \
    apt-get upgrade -y -q &&
    apt-get curl -y -q

# Include nodejs v6.x PPA
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash

# Install nodejs
RUN apt-get install -y nodejs

# Install CLI packages globally
RUN npm install -g yarn @angular/cli karma-cli protractor

# Update Selenium & Drivers
RUN webdriver-manager update

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
#ENV App World

# Run ng serve when the container launches
#CMD ["ng", "serve"]
