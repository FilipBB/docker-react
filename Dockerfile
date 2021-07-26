# Build Phase
FROM node:alpine AS builder
WORKDIR '/home/node/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
COPY --from=builder /home/node/app/build /usr/share/nginx/html
