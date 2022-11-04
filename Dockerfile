# This phase is called builder
FROM node:alpine as builder  


WORKDIR '/app'
COPY  package.json .
RUN npm install
COPY . .

RUN npm run build


#Second phase
FROM  nginx   

#Copy from previous phase the build directory
COPY  --from=builder /app/build /usr/share/ngnix/html 