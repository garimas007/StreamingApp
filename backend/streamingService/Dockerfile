# Use the Node.js 20 image as the base image
FROM node:20

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Install Prometheus client for Node.js
RUN npm install prom-client

# Expose the port on which your application will run
EXPOSE 3002

# Set the default port for the application
ENV PORT=3002

# Start the application with Prometheus monitoring
CMD ["node", "index.js"]
