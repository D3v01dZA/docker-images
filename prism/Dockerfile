FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy prism.tools content
COPY prism.tools/ .

# Expose port 8000
EXPOSE 8000

# Serve the static site using Python's built-in HTTP server
CMD ["python", "-m", "http.server", "8000"]