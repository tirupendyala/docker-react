FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build is the only folder we require for production version of the app

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
