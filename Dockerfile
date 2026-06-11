FROM docker.io/redhat/ubi9:latest AS builder
RUN curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - \
    && dnf install -y nodejs python3 make gcc-c++ \
    && dnf clean all
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --omit=dev
COPY server.js .

FROM docker.io/redhat/ubi9:latest
RUN curl -fsSL https://rpm.nodesource.com/setup_20.x | bash - \
    && dnf install -y nodejs \
    && rm -rf /usr/lib/node_modules/npm /usr/bin/npm /usr/bin/npx \
    && dnf clean all
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/server.js .
COPY run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8080
ENTRYPOINT ["bash", "/run.sh"]
