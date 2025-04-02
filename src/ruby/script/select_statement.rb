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

# SELECT文を変数resultに代入
result = conn.exec("SELECT * FROM Shohin")

puts "クエリ結果を表示 -> #<PG::Result:オブジェクト名>が表示される"
puts result
puts "\n"

puts "psqlっぽく表示させたいじゃない by ChatGPTパイセン"
puts "+------+------------------+------------------+--------+--------+------------+"
puts "| " + "shohin_id".center(4) + " | " +
     "shohin_mei".center(16) + " | " +
     "shohin_mei".center(16) + " | " +
     "shohin_tanka".center(6) + " | " +
     "shiire_tanka".center(6) + " | " +
     "torokubi".center(10) + " |"
puts "+------+------------------+------------------+--------+--------+------------+"

result.each do |row|
  puts "| " + row['shohin_id'].to_s.center(4) + " | " +
       row['shohin_mei'].center(16) + " | " +
       row['shohin_bunrui'].center(16) + " | " +
       row['hanbai_tanka'].to_s.center(6) + " | " +
       row['shiire_tanka'].to_s.center(6) + " | " +
       row['torokubi'].to_s.center(10) + " |"
end

puts "+------+------------------+------------------+--------+--------+------------+"
puts "\n"

puts "【クエリ結果をブロックごとに表示】"
result.each do |row|
  puts row
end
puts "\n"

puts "【カラム名なし】"
result.each_row do |row|
  p row
end
puts "\n"

puts "【SELECTした行数を表示したりとか。厳密には、変更を及ぼした数】"
puts "#{result.cmd_tuples}件のレコードを取得したよ"
puts "\n"

puts "【クエリ結果の行数】"
puts "#{result.ntuples}件のレコードを取得したよ"
puts "\n"

puts "【クエリ結果のカラム数】"
puts "カラム数は#{result.nfields}だよ"
puts "\n"

puts "【クエリ結果のうち、n列目の結果を返す】"
puts "商品ラインナップは#{result.column_values(1)}だよ"
puts "\n"

puts "【クエリ結果のうち、指定したカラム名を配列で返す】"
puts "商品ラインナップは#{result.field_values('shohin_mei')}ポポ"
puts "\n"

puts "【クエリ結果を二次元配列で返す】"
puts "それぞれのレコードは#{result.values}だよ"
puts "\n"

puts "【二次元配列のポル太郎(行, 列)】"
puts result.getvalue(8, 1)

conn.close
