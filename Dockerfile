# Stage 1: Fetch Git and Go from an Alpine image
FROM alpine:latest as builder
RUN apk add --no-cache git go curl ca-certificates openssl nano ncurses

# Stage 2: Minimal image with Git and Go
FROM cgr.dev/chainguard/busybox@sha256:19f02276bf8dbdd62f069b922f10c65262cc34b710eea26ff928129a736be791
USER root

# Copy Git binary and dependencies
COPY --from=builder /usr/bin/git /usr/bin/git
COPY --from=builder /usr/libexec/git-core /usr/libexec/git-core
COPY --from=builder /usr/share/git-core /usr/share/git-core
COPY --from=builder /lib /lib
COPY --from=builder /usr/lib /usr/lib
COPY --from=builder /etc/ssl /etc/ssl
COPY --from=builder /etc/ca-certificates /etc/ca-certificates
COPY --from=builder /etc/nsswitch.conf /etc/nsswitch.conf

# Copy Go binary and dependencies
COPY --from=builder /usr/bin/go /usr/bin/go
COPY --from=builder /usr/lib/go /usr/lib/go
COPY --from=builder /usr/lib/go/pkg /usr/lib/go/pkg
COPY --from=builder /usr/lib/go/src /usr/lib/go/src
COPY --from=builder /usr/lib/go/bin /usr/lib/go/bin

# Copy Nano binaries
COPY --from=builder /usr/bin/nano /usr/bin/nano

# Copy terminfo database for proper terminal support
COPY --from=builder /etc/terminfo /usr/share/terminfo

# Set environment variables for terminal and Go
ENV TERM=xterm \
    GOROOT=/usr/lib/go \
    PATH=$PATH:/usr/lib/go/bin

# Set up a writable working directory
WORKDIR /workspace
RUN mkdir -p /workspace && chmod -R 777 /workspace

# Test the installation
CMD ["sh"]
