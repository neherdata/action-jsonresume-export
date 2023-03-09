FROM node:16

ENV RESUME_PUPPETEER_NO_SANDBOX=true

LABEL repository="https://github.com/tylermneher/resume.tylermneher.me"
LABEL homepage="https://github.com/tylermneher/resume.tylermneher.me"
LABEL maintainer="Tyler M. Neher <tyler@neherdata.com>"

RUN apt-get -q -q -y update && apt-get -q -q -y install jq libnss3 libatk1.0 libatk-bridge2.0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2

RUN mkdir -p /app
WORKDIR /app

RUN npm install -g resume-cli

COPY entrypoint.sh /app

ENTRYPOINT ["/app/entrypoint.sh"]
