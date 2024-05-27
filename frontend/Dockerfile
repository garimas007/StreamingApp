# Select base image
FROM node:18

# Set Working directory
WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN npm install

# Expose port
EXPOSE 3000

# Start the frontend
CMD [ "npm", "start" ]
