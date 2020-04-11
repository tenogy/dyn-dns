ARG VERSION=3.0.100-alpine3.9
FROM mcr.microsoft.com/dotnet/core/sdk:$VERSION AS build
WORKDIR /src
COPY ["/src/Tenogy.Dns.Api/Tenogy.Dns.Api.csproj", "app/"]
RUN dotnet restore --disable-parallel "app/Tenogy.Dns.Api.csproj"
COPY ["/src/Tenogy.Dns.Api/", "app/"]
WORKDIR /src/app
RUN dotnet publish "Tenogy.Dns.Api.csproj" -c Release -r linux-musl-x64 -o /app

FROM tenogy/blank AS src
WORKDIR /app
COPY --from=build /app ./
