FROM alpine:latest

# Set the foundry install home
RUN adduser -D foundry
RUN mkdir -p /home/foundry/fvtt

ENV FOUNDRY_HOME=/home/foundry/fvtt
ENV FOUNDRY_DATA=/config/foundrydata

RUN apk add --update nodejs libarchive-tools

# Set the current working directory
WORKDIR "${FOUNDRY_HOME}"

#copy found
COPY foundryvtt.zip .

#unzip
RUN bsdtar -xf foundryvtt.zip
RUN rm foundryvtt.zip

CMD node ${FOUNDRY_HOME}/resources/app/main.js --dataPath=${FOUNDRY_DATA}
