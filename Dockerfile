# Use an official Python runtime as the base image
FROM python:3.9

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code to the container
COPY . .

# Install Gunicorn
RUN pip install gunicorn

# Expose the desired port (change it if needed)
EXPOSE 5000

# Set the entry point command to run the Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
