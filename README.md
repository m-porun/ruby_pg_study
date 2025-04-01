# PostgreSQLをRubyで動かす

SQL ゼロからはじめるデータベース操作の[9章 アプリケーションからデータベースへ接続する](https://www.notion.so/9-1ba4f0234d2280f3b012fb4f0320c114?pvs=21)をベースに、JavaではなくRubyで動かした場合を検証する

# 9章でやったこと

- PostgreSQLはローカル環境でダウンロード済み
    - バージョンは**14.13** (Homebrew)
    - Javaを触る前にデータベースは構築済み
- Javaをローカル環境でダウンロード
- JDBCドライバPostgreSQL JDBC DriverをダウンロードしてJavaとPostgreSQLを接続できるようにした
- Javaで書いた内容をコンパイルして`java` でクエリ実行させていた
- SELECT, DELETE, INSERT, UPDATEをJavaファイルでする方法を学んだ

# こっからやること

- DockerでRuby環境を構築する
    - ローカルにRuby入れるのだるい
- RubyでPostgreSQLにアクセスさせる
    - pgというgemがあるらしい
- .rbファイルで9章+αの作業を行う
    - テーブルの作成
    - INSERT
    - SELECT
    - UPDATE
    - DELETE