# 環境構築
- docker-compose.ymlファイルよりも上階層の、ルートディレクトリに移動
```
docker compose build
```

- rubyファイルを実行する
```
docker compose up
docker exec -it ruby /bin/bash
bundle exec ruby /home/ruby/実行したいファイル名.rb
```
- ちゃんと実行できているか確かめ用
```
bundle exec ruby /home/ruby/test_postgresql.rb
```

- psqlを使ってコマンドラインでSQL打ちたい時
```
docker exec -it postgres /bin/bash
psql -U root -d test
```

# 概要
Docker環境でPostgreSQLをRubyで動かす

[SQL ゼロからはじめるデータベース操作](https://amzn.asia/d/8eiA7vy)の[9章 アプリケーションからデータベースへ接続する](https://www.notion.so/9-1ba4f0234d2280f3b012fb4f0320c114?pvs=21)をベースに、JavaではなくRubyで動かした場合を検証した結果をリポジトリに入れた

# このリポジトリでできること

- DockerでRuby用コンテナ、PostgreSQL用コンテナを構築する
    - ローカルにRuby入れるのがだるかったから
- RubyでPostgreSQLにアクセスさせる
    - pgというgemを利用
- .rbファイルで以下のことが実行できる
    - テーブルの作成
    - INSERT
    - SELECT
    - UPDATE
    - DELETE

# 作成したテーブル
```
        List of relations
 Schema |  Name  | Type  | Owner
--------+--------+-------+-------
 public | curry  | table | root
 public | shohin | table | root
 public | test1  | table | root
(3 rows)
```
- ShohinテーブルはSQL ゼロからはじめるデータベース操作のサンプルコードを参考にしている
- Curryテーブルは自作