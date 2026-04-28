# Start with instant-coffee.
ARG INSTANT_COFFEE_VERSION=0.10.3
FROM ghcr.io/lukejoshuapark/instant-coffee:${INSTANT_COFFEE_VERSION} AS build
ARG TARGETARCH

ARG DOTNET_VERSION=10.0

# Install .NET.
COPY ./scripts/install-dotnet.sh ./
RUN chmod u+x ./install-dotnet.sh && ./install-dotnet.sh && rm ./install-dotnet.sh

# Squash everything together.
FROM scratch
COPY --from=build / /
ENV HOME="/root"
ENV PATH="/root/.local/bin:/root/.dotnet:/root/.cargo/bin:/root/go/bin:/usr/local/go/bin:/usr/local/node/bin:$PATH"
ENV GOROOT="/usr/local/go"
ENV GOPATH="/root/go"
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
