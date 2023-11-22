#!/bin/bash

aws s3 cp $S3_PATH /app/models/Stable-diffusion/

./webui.sh --listen --api --xformers
