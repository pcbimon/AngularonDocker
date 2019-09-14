FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install 
# RUN npm rebuild node-sass
RUN npm run build --prod

FROM nginx:alpine
COPY --from=node /app/dist/AngularonDocker /usr/share/nginx/html