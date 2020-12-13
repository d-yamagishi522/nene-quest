FROM node:12-alpine
WORKDIR /nene-quest
COPY . .

ENV HOST 0.0.0.0
ENV PORT 5000

# インストール
RUN yarn install && yarn run build

# 起動
EXPOSE 5000
ENTRYPOINT yarn run start