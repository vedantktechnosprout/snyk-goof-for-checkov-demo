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

# Upgrade to Node 18 (fixes Snyk bootstrap; keeps demo vulns in app code/deps).
FROM node:18.13.0

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

# Tweak kept for registry compatibility (optional on Node 18) + install production deps (skips devDeps).
RUN npm config set strict-ssl false && npm install --production

EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
