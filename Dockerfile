FROM golang:1.17-alpine3.15 as multistage

WORKDIR /desafio_docker
ADD . .
RUN go mod init start-app && go build

FROM scratch
COPY --from=multistage /desafio_docker/start-app .
CMD [ "/start-app" ]