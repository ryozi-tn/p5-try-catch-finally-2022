
試し方
--------------



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