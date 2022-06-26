FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
# `/workspace` is the default working directory for the pytorch image.
ARG workdir=/workspace
WORKDIR ${workdir}

# setup
RUN apt-get update && apt-get install -y software-properties-common rsync
RUN add-apt-repository -y ppa:git-core/ppa && apt-get update && apt-get install -y git libglib2.0-dev && apt-get update
RUN apt-get -y install nano graphviz libwebp-dev \
   ruby ruby-dev \
   wget lsb-release

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
    "sentencepiece<0.1.90" \
    spacy \
    tensorboard \
    torchsummary \
    tqdm \
    wandb \
    kaggle \
    dtreeviz \
    treeinterpreter \
    watchdog[watchmedo] \
    waterfallcharts
RUN python -m ipykernel install

