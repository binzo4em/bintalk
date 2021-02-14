FROM node:12-alpine

ARG MYSQL_PASSWORD
ENV PORT=3000 \
    MYSQL_HOST=bintalk.cynaj14cysak.ap-northeast-2.rds.amazonaws.com \
    MYSQL_PORT=3306 \
    MYSQL_DATABASE=bintalk \
    MYSQL_USER=binzo \
    MYSQL_PASSWORD=$MYSQL_PASSWORD
    
WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

EXPOSE 3000
CMD ["npm", "run", "start"]