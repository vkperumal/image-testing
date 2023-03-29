FROM mcr.microsoft.com/dotnet/aspnet:6.0

LABEL maintainer="ops"

WORKDIR /app

RUN useradd -m -s /bin/bash -u 1000 app && \
    chown app:app /app

USER app

ENV ASPNETCORE_URLS=http://*:8080
# Uncomment below to enable readonlyfilesystem on kubernetes
ENV COMPlus_EnableDiagnostics=0
