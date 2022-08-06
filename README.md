# docker_fastai-nbdev

fastai（GPUあり）とnbdevが簡単に利用できるイメージとdocker composeファイル。



# 特徴

- pytorch・fastai・nbdevインストール済み
- データセット（テストデータ）は含まれない



## 主なpythonパッケージ

- fastai 2.x
- nbdev 2.x
  - 依存：　python >= 3.9
- pytorch 1.12.x



## 環境

| **項目**   | **値**                                 |
| ---------- | -------------------------------------- |
| 元イメージ | nvidia/cuda:11.7.0-runtime-ubuntu20.04 |
| OS         | Ubuntu20.04 LTS                        |
| Python     | 3.9.13                                 |


　
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



注意点

- Docker v1.xを使用している場合は、 `docker-compose up` かも。





# 開発

lilacs2039, yyyymmddは適宜書き換えのこと。

## DockerFileのビルド

```
docker build ./ -t lilacs2039/fastai-nbdev:yyyymmdd
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



## コマンドメモ

```
# コンテナ　全削除
docker rm $(docker ps -a -q)
```







