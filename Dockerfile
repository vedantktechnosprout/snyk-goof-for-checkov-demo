# FROM node:6-stretch

# RUN mkdir /usr/src/goof
# RUN mkdir /tmp/extracted_files
# COPY . /usr/src/goof
# WORKDIR /usr/src/goof

# RUN npm update
# RUN npm install
# EXPOSE 3001
# EXPOSE 9229
# ENTRYPOINT ["npm", "start"]

# Use a modern, LTS Node base image (18 is stable and matches your original intent).
FROM node:18.13.0

# Create app directory.
RUN mkdir -p /usr/src/goof
WORKDIR /usr/src/goof

# Copy package files first for caching (install deps change less often).
COPY package*.json ./

# Install dependencies (use ci for reproducible builds; skip dev deps for runtime).
RUN npm ci --only=production && npm cache clean --force

# Copy app source.
COPY . .

# Expose ports (as in your original).
EXPOSE 3001
EXPOSE 9229

# Start the app.
ENTRYPOINT ["npm", "start"]
