
試し方
--------------

### Dockerをインストールしておく

https://docs.docker.com/engine/install/ubuntu/

### コンテナを動かす

各ディレクトリでdocker build && docker runを行う

```bash
# 例: p5-featureのコードを実行する
cd p5-feature
sudo docker build -t $(basename $PWD) . && sudo docker run --rm -it "$(basename $PWD)"
```

一括実行する場合

```bash
for dir in nice-try tiny-try p5-feature; do
  (
    cd "$dir"
    sudo docker build -t "p5-try-catch-finally:$(basename $PWD)" . &&
    sudo docker run --rm "p5-try-catch-finally:$(basename $PWD)"
  )
  echo "======"
done
```

