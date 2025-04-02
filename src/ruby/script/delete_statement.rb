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
conn.transaction do
  conn.exec("DELETE FROM Shohin WHERE shohin_mei = '山田ポル太郎';")
  conn.exec("DELETE FROM Shohin WHERE shohin_mei = '山田ポル次郎';")
end

result = conn.exec("SELECT * FROM Shohin;")

puts "削除後の結果"

result.each do |row|
  puts row
end

conn.close
