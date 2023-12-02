#!/bin/bash

sudo /app/mount_tmpfs.sh

# Set AWS credentials
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION
export S3_PATH=$S3_PATH
export APP_VERSION=$APP_VERSION

aws s3 cp $S3_PATH /app/models/Stable-diffusion/

./webui.sh --listen --api --xformers
