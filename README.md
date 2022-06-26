# docker_fastai-nbdev



fastai/docker-containersの内容を全部ありにしたイメージ





# 作成時の参考

pytorchイメージ一覧　[pytorch/pytorch Tags | Docker Hub](https://hub.docker.com/r/pytorch/pytorch/tags)

pytorch(cuda)イメージでfastaiインストール　[Details of FastAI-Docker, a more Docker-centric view. · Amy Tabb](https://amytabb.com/ts/2020-10-03/#:~:text=Details 7. Customizing the build using PyTorch as a base image.)

Jekyllインストール　[docker-containers/script.sh at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/jekyll/tmp_scripts/script.sh)



# 特徴

- fastaiは`/workspace/fastai`に編集インストール
- テストデータはなし
    - 参考元のイメージはCourseの学生を想定しているので、データセットをイメージに含めてると思われる。
    - 学習ではなく実問題に使えるイメージを作りたいので、データサイズ大きくなりがちなデータセットは入れない。
    - 参考　[docker-containers/download_testdata.py at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/fastai/tmp_scripts/download_testdata.py)

 

# 詳細

| **項目**         | **値**                                         |
| ---------------- | ---------------------------------------------- |
| 元イメージ       | pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime |
| OS               |                                                |
| Pythonバージョン |                                                |
| Ruby             |                                                |
| Jekyll           |                                                |



# 使い方



# 開発

## DockerFileのビルド

```
docker build ./ -t fastai-nbdev
```



