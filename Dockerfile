FROM node:alpine AS builder
RUN mkdir /myapp
WORKDIR "/myapp"
COPY package.json .
RUN npm install
COPY . . 
RUN npm build

FROM nginx
COPY --from=builder /myapp/build /usr/share/nginx/html

