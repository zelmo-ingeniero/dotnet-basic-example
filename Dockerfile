FROM mcr.microsoft.com/dotnet/sdk:8.0

WORKDIR /app

COPY . .

EXPOSE 5209

RUN mkdir -p /datadog/tracer
RUN mkdir -p /home/LogFiles/dotnet

ADD https://github.com/DataDog/dd-trace-dotnet/releases/download/v2.51.0/datadog-dotnet-apm-2.51.0.tar.gz /datadog/tracer
RUN cd /datadog/tracer && tar -zxf datadog-dotnet-apm-2.51.0.tar.gz

CMD ["dotnet", "run"]
