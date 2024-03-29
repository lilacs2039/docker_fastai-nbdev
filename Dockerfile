# Image : fastai-nbdev

FROM nvidia/cuda:11.7.0-runtime-ubuntu20.04


# FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
# `/workspace` is the default working directory for the pytorch image.
ARG workdir=/workspace
WORKDIR ${workdir}

# setup
    # libgl1-mesa-dev : for opencv
RUN apt-get update && apt-get install -y software-properties-common rsync libgl1-mesa-dev
RUN add-apt-repository -y ppa:git-core/ppa && apt-get update \
    && apt-get install -y git libglib2.0-dev && apt-get update
RUN apt-get -y install nano graphviz libwebp-dev \
   ruby ruby-dev \
   wget lsb-release

# python build & install
ARG python_version=3.9.13
RUN apt-get install -y build-essential libbz2-dev libdb-dev \
  libreadline-dev libffi-dev libgdbm-dev liblzma-dev \
  libncursesw5-dev libsqlite3-dev libssl-dev \
  zlib1g-dev uuid-dev tk-dev
RUN wget https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tar.xz \
    && tar xJf Python-${python_version}.tar.xz && rm Python-${python_version}.tar.xz
RUN cd Python-${python_version} && ./configure && make && make install
WORKDIR ${workdir}
# curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN wget https://bootstrap.pypa.io/get-pip.py\
    && python3.9 get-pip.py \
    && rm get-pip.py

# python packages
RUN pip install -U albumentations \
    catalyst \
    captum \
    fastai \
    fastcore \
    "fastprogress>=0.1.22" \
    graphviz \
    jupyter \
    jupyterlab \
    kornia \
    matplotlib \
    nbdev \
    neptune-client \
    opencv-python \
    pandas \
    pillow \
    pyarrow \
    pydicom \
    pyyaml \
    scikit-learn \
    scikit-image \
    scipy \
    seaborn \
    spacy \
    tensorboard \
    torchsummary \
    tqdm \
    wandb \
    kaggle \
    dtreeviz \
    treeinterpreter \
    watchdog[watchmedo] \
    waterfallcharts \
    opencv-python \
    japanize_matplotlib \
    timm \
    torchinfo \
    attrdict \
    imblearn
    # "sentencepiece<0.1.90" \
# RUN python -m ipykernel install

