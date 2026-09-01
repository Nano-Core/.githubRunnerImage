FROM myoung34/github-runner:ubuntu-noble

ARG DOCKERFILE_HASH
ARG CONTAINER_REGISTRY_SOURCE_LABEL
LABEL nano.dockerfile-hash="${DOCKERFILE_HASH}"
LABEL org.opencontainers.image.source="${CONTAINER_REGISTRY_SOURCE_LABEL}"

USER root

RUN apt-get update && apt-get install -y \
    curl wget ca-certificates gnupg lsb-release unzip \
    software-properties-common apt-transport-https && \
    rm -rf /var/lib/apt/lists/*

# Azure CLI
ENV AZURE_EXTENSION_DIR=/opt/azure-cli-extensions

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

RUN apt-get update && apt-get install -y \
    gcc libpq-dev python3-dev && \
    rm -rf /var/lib/apt/lists/* && \
    az extension add --name maintenance && \
    az extension add --name rdbms-connect && \
    chmod -R a+rX $AZURE_EXTENSION_DIR

# kubectl
RUN curl -LO https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl

# Helm
RUN curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# .NET 10 SDK
RUN curl -sSL https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh && \
    chmod +x dotnet-install.sh && \
    ./dotnet-install.sh --channel 10.0 --install-dir /usr/share/dotnet && \
    ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet && \
    rm dotnet-install.sh

# EF Core tools
RUN dotnet tool install dotnet-ef --version 10.* --tool-path /opt/ef-tools/10.0

# MySQL client
RUN apt-get update && apt-get install -y mysql-client && rm -rf /var/lib/apt/lists/*

# PostgreSQL client
RUN apt-get update && apt-get install -y postgresql-client && rm -rf /var/lib/apt/lists/*

# SQL Server tools
RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/24.04/prod noble main" \
    > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 mssql-tools18 unixodbc-dev && \
    rm -rf /var/lib/apt/lists/*

ENV PATH="${PATH}:/opt/mssql-tools18/bin"

USER runner