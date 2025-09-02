# ============================
# React Dev Server Container
# ============================
FROM node:22.14.0-alpine

WORKDIR /usr/src/app
ENV PATH=/usr/src/app/node_modules/.bin:$PATH

# Install tools needed (git for some npm deps)
RUN apk add --no-cache git

# Copy dependency files
COPY package*.json ./

# Install ALL dependencies (dev + prod)
RUN npm install --legacy-peer-deps

# Copy source code
COPY . .

# Expose React dev server port
EXPOSE 80

# Start React app in dev mode
CMD ["npm", "start"]
