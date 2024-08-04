FROM python:slim AS builder

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install python related packages
RUN apt-get update && \
    apt-get install -y sudo && \
    sudo apt-get install -y unzip nano curl && \
    curl -Lo "/tmp/chromedriver-linux64.zip" "https://storage.googleapis.com/chrome-for-testing-public/127.0.6533.88/linux64/chromedriver-linux64.zip" && \
    curl -Lo "/tmp/chrome-linux64.zip" "https://storage.googleapis.com/chrome-for-testing-public/127.0.6533.88/linux64/chrome-linux64.zip" && \
    unzip /tmp/chromedriver-linux64.zip -d /opt/ && \
    unzip /tmp/chrome-linux64.zip -d /opt/

RUN sudo apt-get update && \
    sudo apt-get install -y libnss3 chromium chromium-driver

RUN pip install selenium==4.23.1

RUN mv /opt/chromedriver-linux64/chromedriver /opt/chromedriver
RUN mv /opt/chrome-linux64 /opt/chrome
