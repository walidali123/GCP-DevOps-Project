FROM python:3.8-slim-buster

WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the default Flask port
EXPOSE 5000

# Command to run the application
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
