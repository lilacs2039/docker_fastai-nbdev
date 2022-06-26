FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
# `/workspace` is the default workdir for pytorch image.
WORKDIR /workspace

# setup
RUN apt-get update && apt-get install -y software-properties-common rsync
RUN add-apt-repository -y ppa:git-core/ppa && apt-get update && apt-get install -y git libglib2.0-dev && apt-get update
RUN apt-get -y install nano\
   graphviz \
   libwebp-dev

# python packages
RUN pip install albumentations \
    catalyst \
    captum \
    "fastprogress>=0.1.22" \
    graphviz \
    jupyter \
    kornia \
    matplotlib \
    nbdev \
    neptune-cli \
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
    waterfallcharts

# fastai (editable install)
RUN git clone https://github.com/fastai/fastai.git --depth 1  && git clone https://github.com/fastai/fastcore.git --depth 1
RUN /bin/bash -c "cd fastai && pip install -e \".[dev]\" && cd ../fastcore && pip install -e \".[dev]\"; fi"

# jekyll
RUN pip install -Uq nbdev watchdog[watchmedo] jupyter && \
    python -m ipykernel install && \
    apt install -y ruby-full && \
    gem install jekyll bundler && \
    bundle config set system 'true' && \
    bundle install && \
    wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb && \
    dpkg -i pandoc-2.9.1.1-1-amd64.deb && \
    rm -rf Gemfile* && \
    rm -rf /var/lib/gems/*/cache && \
    rm -rf /var/lib/gems/*/doc && \
    rm -rf /usr/share/ri


