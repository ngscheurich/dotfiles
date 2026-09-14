# Pi coding agent

FROM alpine:3.23.0

RUN apk add --no-cache \
    bash \
    curl \
    fd \
    git \
    npm \
    ripgrep

ENV LANG=C.UTF-8 \
    PATH="/root/.local/bin:/root/.local/share/mise/shims:${PATH}"

RUN set -eux; \
    npm install -g --ignore-scripts @earendil-works/pi-coding-agent; \
    pi --version; \
    npm cache clean --force

CMD ["pi"]
