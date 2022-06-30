# docker_fastai-nbdev

fastai（GPUあり）とnbdevが簡単に利用できるイメージとdocker composeファイル。



# 特徴

- fastai・nbdevインストール済み
- Jekyllは`fastai/jekyll`イメージを使う
- データセット（テストデータ）は含まれない
    - 参考元のイメージはCourseの学生を想定しているので、データセットをイメージに含めてると思われる。
    - 学習ではなく実問題に使えるイメージを作りたいので、データサイズ大きくなりがちなデータセットは入れない。
    - 参考　[docker-containers/download_testdata.py at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/fastai/tmp_scripts/download_testdata.py)

 

## 詳細

| **項目**   | **値**                                         |
| ---------- | ---------------------------------------------- |
| 元イメージ | pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime |
| OS         | Ubuntu18.04 LTS                                |
| Python     | 3.8.12                                         |


　
# 使い方

## 想定環境

- Nvidia Docker
  - PyTorchのcudaイメージを使用するため
- (Windowsの場合)
  - WSL2 + Ubuntu + Docker CLI
    - 参考：[Enable NVIDIA CUDA on WSL 2 | Microsoft Docs](https://docs.microsoft.com/ja-jp/windows/ai/directml/gpu-cuda-in-wsl)



## 実行

1. 本イメージで作業したいnbdevプロジェクト※１のルートフォルダで、以下のコマンドを実行する。

```bash
# 本リポジトリの`docker-compose.yml`を取得
wget https://raw.githubusercontent.com/lilacs2039/docker_fastai-nbdev/main/docker-compose.yml
# 環境立ち上げ
sudo service docker start
docker compose up
```

2. ローカルサーバへアクセス

- Jupyter Lab : http://localhost:8888
- Jekyll : http://localhost:4000/(lib_name)



※１：nbdevプロジェクトとは、[fastai/nbdev_template: Template for nbdev projects](https://github.com/fastai/nbdev_template)から作成したプロジェクトのこと。



注意点

- `docker compose up`は、nbdevプロジェクト設定（`settings.ini`）ができていないとエラーになる。

- Docker v1.xを使用している場合は、 `docker-compose up` かも。




# 開発

lilacs2039, yyyymmddは適宜書き換えのこと。

## DockerFileのビルド

```
docker build ./ -t lilacs2039/fastai-nbdev
```



## DockerHubへのプッシュ

```
docker login
docker tag lilacs2039/fastai-nbdev lilacs2039/fastai-nbdev:yyyymmdd
docker push lilacs2039/fastai-nbdev:yyyymmdd
```





# 作成時の参考

pytorchイメージ一覧　[pytorch/pytorch Tags | Docker Hub](https://hub.docker.com/r/pytorch/pytorch/tags)

pytorch(cuda)イメージでfastaiインストール　[Details of FastAI-Docker, a more Docker-centric view. · Amy Tabb](https://amytabb.com/ts/2020-10-03/#:~:text=Details 7. Customizing the build using PyTorch as a base image.)

Jekyllインストール　[docker-containers/script.sh at c049a5b5374445cc619d397854be0f1fd5b13e65 · fastai/docker-containers](https://github.com/fastai/docker-containers/blob/c049a5b5374445cc619d397854be0f1fd5b13e65/jekyll/tmp_scripts/script.sh)

