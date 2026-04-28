# Build Stage
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package file
COPY package*.json ./

# Install dependencies
RUN npm Install 
RUN npm install newrelic --save

# Copy the application source code
COPY . .

# Switch to the non-root
USER node

# Expose app's port
EXPOSE 3000

# Start the application
CMD ["node", "-r", "newrelic", "index.js"]