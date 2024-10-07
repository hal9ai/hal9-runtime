FROM pytorch/pytorch:2.1.2-cuda11.8-cudnn8-devel
WORKDIR /app/

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash -
RUN apt-get -y install nodejs
RUN apt-get -y install wget

RUN apt-get -y install cpanminus
RUN cpanm Image::ExifTool

RUN npm -v
RUN npm install --save exiftool-vendored

COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt