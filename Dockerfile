FROM node:6-stretch

RUN mkdir /usr/src/goof
RUN mkdir /tmp/extracted_files
COPY . /usr/src/goof
WORKDIR /usr/src/goof

# RUN npm update
# RUN npm install

# Install production deps only (skips Snyk if dev/optional; keeps SSL tweak).
RUN npm config set strict-ssl false && npm install --production

EXPOSE 3001
EXPOSE 9229
ENTRYPOINT ["npm", "start"]
