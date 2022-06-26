FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime
# `/workspace` is the default working directory for the pytorch image.
ARG workdir=/workspace
WORKDIR ${workdir}

# setup
COPY Gemfile ./
RUN apt-get update && apt-get install -y software-properties-common rsync
RUN add-apt-repository -y ppa:git-core/ppa && apt-get update && apt-get install -y git libglib2.0-dev && apt-get update
RUN apt-get -y install nano graphviz libwebp-dev \
   ruby ruby-dev \
   wget lsb-release

# python packages
RUN pip install -U albumentations \
    catalyst \
    captum \
    "fastprogress>=0.1.22" \
    graphviz \
    jupyter \
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

# fastai (editable install)
RUN git clone https://github.com/fastai/fastai.git --depth 1  && git clone https://github.com/fastai/fastcore.git --depth 1
RUN /bin/bash -c 'cd fastai && pip install -e ".[dev]" && cd ../fastcore && pip install -e ".[dev]"' && \
    cd ${workdir}

# ruby/gem/jekyll
# https://github.com/fastai/docker-containers/blob/master/jekyll/tmp_scripts/script.sh
RUN gem install bundler jekyll
RUN bundle config set system 'true' && \
    bundle install && \
    wget https://github.com/jgm/pandoc/releases/download/2.9.1.1/pandoc-2.9.1.1-1-amd64.deb && \
    dpkg -i pandoc-2.9.1.1-1-amd64.deb && \
    rm -rf Gemfile* && \
    rm -rf /var/lib/gems/*/cache && \
    rm -rf /var/lib/gems/*/doc && \
    rm -rf /usr/share/ri


