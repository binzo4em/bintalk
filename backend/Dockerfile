FROM node:12-alpine

ARG MYSQL_PASSWORD
ENV PORT=3000 \
    MYSQL_HOST=localhost \
    MYSQL_PORT=3306 \
    MYSQL_DATABASE=bintalk \
    MYSQL_USER=root \
    MYSQL_PASSWORD=$MYSQL_PASSWORD
    
WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

CMD ["npm", "run", "start"]