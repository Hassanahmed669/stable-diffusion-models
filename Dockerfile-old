FROM python:3.10.13-bullseye

WORKDIR /app

COPY . .

RUN useradd -ms /bin/bash ubuntu

RUN chown -R ubuntu:ubuntu /app

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

#RUN distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
#    && curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | apt-key add - \
#    && curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | tee /etc/apt/sources.list.d/nvidia-container-runtime.list \
#    && apt-get update \
#    && apt-get install -y nvidia-container-runtime \
#    && rm -rf /var/lib/apt/lists/*

#RUN pip3 install -r requirements.txt \
#    && pip3 install xformers

#RUN pip3 install xformers

USER ubuntu

RUN echo '#!/bin/bash \n\
./webui.sh --listen --api' > ./entrypoint.sh \
    && chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["tail", "-f", "/dev/null"]
