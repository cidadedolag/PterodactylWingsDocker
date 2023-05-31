FROM alpine:latest
LABEL maintainer=felipmoreira8@gmail.com

# Install required packages
RUN apk add --no-cache \
        curl \
        bash \
        docker-engine docker-cli \
        certbot \
        openssl

COPY root/ /

# Download latest Wings build from project repository: https://github.com/pterodactyl/wings
ADD https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64 /usr/bin/wings

# Make the binary executable
RUN chmod u+x /usr/bin/wings
RUN chmod u+x /usr/local/sbin/container-run.bash

EXPOSE 2675 2676 443 80 8080

# Docker run starting on container-run.sh
ENTRYPOINT ["sh", "/usr/local/sbin/container-run.bash"]