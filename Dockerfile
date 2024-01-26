# Build stage
FROM node:20.10.0-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npx ngcc -properties es5 browser module main --first-only --create-ivy-entry-point
COPY . .
RUN npm run build

# Production stage
FROM nginx:latest
COPY --from=build /app/dist/image-uploader-app/ /usr/share/nginx/html
EXPOSE 80
