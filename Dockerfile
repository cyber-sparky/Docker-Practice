
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy the local code into the container at /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install uvicorn

# Expose port 5000
EXPOSE 5000

# Define environment variable
ENV UVICORN_CMD="/usr/local/bin/uvicorn main:app --host 0.0.0.0 --port 5000 --reload"

# Command to run on container start
CMD ["bash", "-c", "$UVICORN_CMD"]
