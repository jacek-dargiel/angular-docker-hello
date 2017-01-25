FROM node:7.4
RUN curl -o- -L https://yarnpkg.com/install.sh | bash && \
    mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app
RUN /root/.yarn/bin/yarn install && \
    /root/.yarn/bin/yarn cache clean && \
    rm -rf /root/.yarn
COPY . /usr/src/app
EXPOSE 4200
CMD ["npm", "start"]
