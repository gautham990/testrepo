# Use the official Node.js image from Docker Hub as the base image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json (if exists) to the container
COPY package*.json ./

# Install the app dependencies inside the container
RUN npm install

# Copy the rest of your application code to the container
COPY . .

# Expose the port your Node.js app will run on
EXPOSE 3000

# Run the Node.js app
CMD ["node", "src/app.js"]
