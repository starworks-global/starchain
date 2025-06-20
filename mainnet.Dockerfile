FROM golang:1.19 AS builder
WORKDIR /usr/starchain

COPY . .
RUN go run build/ci.go install

FROM golang:1.19 AS runner
WORKDIR /usr/starchain

COPY --from=builder /usr/starchain/build/bin/geth /usr/local/bin
COPY mainnet.entrypoint.sh /usr/starchain/

RUN chmod +x mainnet.entrypoint.sh

ENV BOOTNODES=""

CMD [ "sh", "-c", "./mainnet.entrypoint.sh" ]