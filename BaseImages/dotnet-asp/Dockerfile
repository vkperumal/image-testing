FROM mcr.microsoft.com/dotnet/aspnet:6.0

LABEL maintainer="ops"

WORKDIR /app

RUN useradd -m -s /bin/bash -u 1000 app && \
    chown app:app /app

# Install the agent
RUN apt-get update && apt-get install -y wget ca-certificates gnupg \
&& echo 'deb http://apt.newrelic.com/debian/ newrelic non-free' | tee /etc/apt/sources.list.d/newrelic.list \
&& wget https://download.newrelic.com/548C16BF.gpg \
&& apt-key add 548C16BF.gpg \
&& apt-get update \
&& apt-get install -y newrelic-dotnet-agent

USER app

ENV ASPNETCORE_URLS=http://*:8080
# Uncomment below to enable readonlyfilesystem on kubernetes
ENV COMPlus_EnableDiagnostics=0

