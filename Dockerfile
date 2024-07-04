# build environment
FROM node:18.3.0 as builder
WORKDIR /app

COPY . .

RUN command npm install
RUN npm run build

# production environment
FROM nginx:stable-alpine
COPY --from=builder /app/build /usr/share/nginx/html
