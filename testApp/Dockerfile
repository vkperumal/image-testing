# hadolint ignore=DL3007
FROM mcr.microsoft.com/dotnet/sdk:6.0

WORKDIR /app

ENV ASPNETCORE_URLS=http://*:5075
# Uncomment below to enable readonlyfilesystem on kubernetes
ENV COMPlus_EnableDiagnostics=0

COPY . .
RUN bash -l -c "dotnet restore testApp.csproj && \
                dotnet publish testApp.csproj -c Debug -o /app/publish"

# FROM dotnet-asp-base:approved

# ARG NR_KEY
# ARG NR_APPNAME

# # Enable the agent
# ENV CORECLR_ENABLE_PROFILING=1 \
# CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
# CORECLR_NEWRELIC_HOME=/usr/local/newrelic-dotnet-agent \
# CORECLR_PROFILER_PATH=/usr/local/newrelic-dotnet-agent/libNewRelicProfiler.so

# WORKDIR /app

# COPY --from=builder --chown=app:app /app/publish .

# ENTRYPOINT ["dotnet", "testApp.dll"]
