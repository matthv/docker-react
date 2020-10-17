# 1st phase
#tag the phase with as
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 2nd phase
FROM nginx
#COPY --from=builder /app/build /usr/share/nginx/html #don't work with AWS
COPY --from=0 /app/build /usr/share/nginx/html
