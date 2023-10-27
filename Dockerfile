# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install required packages
RUN apt-get update && \
    apt-get install -y curl procps

# Install Flask
RUN pip install Flask

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 5000 available to the world outside this container
EXPOSE 5000

RUN touch /app/app.log

# Run app.py when the container launches
CMD ["python", "app.py"]