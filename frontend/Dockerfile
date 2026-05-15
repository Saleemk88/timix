FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Expose port for Vite dev server
EXPOSE 3000

# Start Vite dev server with host enabled to allow access from outside container
CMD ["npm", "run", "dev"]
