# docker_fastai-nbdev

fastai（GPUあり）とnbdevが簡単に利用できるイメージ。



# 特徴

- fastaiは`/workspace/fastai`に編集インストール
- nbdevとJekyllもインストール済み
- データセット（テストデータ）は含まれない
    - 参考元のイメージはCourseの学生を想定しているので、データセットをイメージに含めてると思われる。
    - 学習ではなく実問題に使えるイメージを作りたいので、データサイズ大きくなりがちなデータセットは入れない。
    - 参考　[docker-containers/download_testdata.py at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/fastai/tmp_scripts/download_testdata.py)

 

## 詳細

| **項目**   | **値**                                                  |
| ---------- | ------------------------------------------------------- |
| 元イメージ | pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime          |
| OS         | Ubuntu18.04 LTS                                         |
| Python     | 3.8.12                                                  |
| Ruby       | 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu] |
| Jekyll     | 2.7.6                                                   |



# 使い方

## 想定環境

- Nvidia Docker
  - PyTorchのcudaイメージを使用するため
- (Windowsの場合)
  - WSL2 + Ubuntu + Docker CLI
    - 参考：[Enable NVIDIA CUDA on WSL 2 | Microsoft Docs](https://docs.microsoft.com/ja-jp/windows/ai/directml/gpu-cuda-in-wsl)



## 実行

本イメージで作業したいプロジェクトのルートフォルダで、以下のコマンドを実行する。

```
# 本リポジトリの`docker-compose.yml`をコピーする
curl
# 環境立ち上げ
docker compose up
```

※Docker v1.xを使用している場合は、 `docker-compose up` かも。



# 開発

## DockerFileのビルド

```
docker build ./ -t fastai-nbdev
```





# 作成時の参考

pytorchイメージ一覧　[pytorch/pytorch Tags | Docker Hub](https://hub.docker.com/r/pytorch/pytorch/tags)

pytorch(cuda)イメージでfastaiインストール　[Details of FastAI-Docker, a more Docker-centric view. · Amy Tabb](https://amytabb.com/ts/2020-10-03/#:~:text=Details 7. Customizing the build using PyTorch as a base image.)

Jekyllインストール　[docker-containers/script.sh at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/jekyll/tmp_scripts/script.sh)

