FROM python:3.10.13-bullseye

WORKDIR /app

COPY . .

ARG S3_PATH
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION
ARG APP_VERSION

ENV S3_PATH=${S3_PATH}
ENV AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
ENV AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
ENV AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}
ENV APP_VERSION=${APP_VERSION}

RUN useradd -ms /bin/bash ubuntu

RUN chown -R ubuntu:ubuntu /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y awscli && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y potrace && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

#RUN pip3 install xformers

USER ubuntu

ENTRYPOINT ["/app/entrypoint.sh"]
