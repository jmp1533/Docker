# Use the official MongoDB image from the Docker Hub
FROM mongo:latest

# Set environment variables
ENV MONGO_INITDB_ROOT_USERNAME=admin
ENV MONGO_INITDB_ROOT_PASSWORD=adminpassword
ENV MONGO_INITDB_DATABASE=mydatabase

# Expose MongoDB default port
EXPOSE 27017

# Command to run MongoDB
CMD ["mongod"]