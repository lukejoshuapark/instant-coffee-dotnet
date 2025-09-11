# Start with instant-coffee.
ARG INSTANT_COFFEE_VERSION=0.8.2
FROM ghcr.io/lukejoshuapark/instant-coffee:${INSTANT_COFFEE_VERSION} AS build
ARG TARGETARCH

ARG DOTNET_VERSION=8.0

# Install .NET.
COPY ./scripts/install-dotnet.sh ./
RUN chmod u+x ./install-dotnet.sh && ./install-dotnet.sh && rm ./install-dotnet.sh

# Squash everything together.
FROM scratch
COPY --from=build / /
ENV PATH="/root/.dotnet:$PATH"
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
