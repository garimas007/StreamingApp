# Select Base Image
FROM node:20

# Create Working dir
WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN npm install

# Expose port
EXPOSE 3002

# Start backend
CMD [ "node","index.js" ]