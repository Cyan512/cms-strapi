FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install build dependencies for native modules
RUN apk add --no-cache python3 make g++

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --only=production

# Copy application code
COPY . .

# Build the admin panel
RUN npm run build

# Expose port
EXPOSE 1337

# Set environment variables
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=1337

# Start the application
CMD ["npm", "run", "start"]