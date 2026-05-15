FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# We don't build here because we are setting up for dev with nodemon.
# For production, we would run `npm run build` here.

EXPOSE 5000

CMD ["npm", "run", "dev"]
