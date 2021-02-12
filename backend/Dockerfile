FROM node:12-alpine

ARG MARIADB_PASSWORD
ENV PORT=3000 \
    MARIADB_HOST=bintalk-mariadb \
    MARIADB_PORT=3306 \
    MARIADB_DATABASE=bintalk \
    MARIADB_USER=binzo \
    MARIADB_USER_PASSWORD=$MARIADB_PASSWORD
    
WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

CMD ["npm", "run", "start"]