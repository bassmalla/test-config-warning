FROM node:latest

# Create app directory
WORKDIR /usr/src/app

USER root
const Vulnerability1 = (req, res) => {
    exec(
        'gzip ' + req.query.file_path,
        function (err, data) {
            console.log('err: ', err)
            console.log('data: ', data);
        });
        res.send('Hello World!')
}
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 9200
EXPOSE 8080
CMD [ "node", "server.js" ]

