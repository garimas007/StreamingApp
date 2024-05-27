# Select base image
FROM node:18

# Set Working directory
WORKDIR /app

# Copy everything
COPY . .

# Install dependencies
RUN npm Install

# Start the frontend
CMD [ "npm", "start" ]
