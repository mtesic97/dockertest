FROM node:14.17.0 as builder

WORKDIR '/app'

COPY package.json .

RUN npm isntall

COPY . . 

RUN npm run build 

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html