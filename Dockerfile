FROM eclipse-temurin:8-jre-alpine

# Install msfonts
RUN apk --no-cache add msttcorefonts-installer fontconfig && \
    update-ms-fonts && \
    fc-cache -f

# Install corbel.ttf used in label report
ADD corbel.ttf /usr/share/fonts/
RUN fc-cache -fv

# Install tzdata
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    echo "Etc/GMT+3" >  /etc/timezone

ENV JAVA_OPTS="-Duser.timezone=Etc/GMT+3 -Duser.language=pt -Duser.region=BR"
