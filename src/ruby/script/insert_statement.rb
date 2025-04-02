# PostgreSQLデータベースとRubyをつなげるライブラリ
require 'pg'

# PostgreSQLサーバに接続
conn = PG.connect(
  host: 'postgres',
  port: 5432,
  dbname: 'test',
  user: 'root',
  password: 'pass'
)

# トランザクション使わないバージョン
conn.exec("INSERT INTO Shohin VALUES ('0009', 'ポル太郎' ,'ぬいぐるみ', 3000, 1500, '2005-01-25');")
conn.exec("INSERT INTO Shohin VALUES ('0010', 'ポル次郎', 'ぬいぐるみ', 1500, 800, '2019-07-13');")

puts "データを挿入しました。"
conn.close
