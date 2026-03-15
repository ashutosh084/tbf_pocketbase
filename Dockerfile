FROM alpine:latest

# Change this to the current actual version of PocketBase
ARG PB_VERSION=0.36.6

RUN apk add --no-cache \
    unzip \
    ca-certificates

# download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

EXPOSE 8080

# Start PocketBase and force it to use the Railway Persistent Volume
CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8080", "--dir=/pb_data"]
