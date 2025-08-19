FROM node:20.12.0-alpine AS build

WORKDIR /app

# Copy package.json & package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy rest of the project
COPY . .

# Expose React dev server port
EXPOSE 3000

# Start React app
CMD ["npm", "start"]