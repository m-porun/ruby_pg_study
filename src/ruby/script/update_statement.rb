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
  conn.exec("UPDATE Shohin SET shohin_mei = '山田ポル太郎' WHERE shohin_id = '0009';")
  conn.exec("UPDATE Shohin SET shohin_mei = '山田ポル次郎' WHERE shohin_id = '0010';")
end

result = conn.exec("SELECT shohin_mei FROM Shohin WHERE shohin_id = '0009' OR shohin_id = '0010';")

puts "アップデート結果"

result.each do |row|
  puts row
end

conn.close
