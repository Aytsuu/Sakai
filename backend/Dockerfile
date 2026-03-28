# Use the specific stable version for better security and compatibility
FROM python:3.11-slim-bookworm

WORKDIR /app

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Copy and install requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entrypoint file
COPY entrypoint.sh /entrypoint.sh

# Give the container permission to execute it
RUN chmod +x /entrypoint.sh

# Use the script to start the container
ENTRYPOINT ["/entrypoint.sh"]