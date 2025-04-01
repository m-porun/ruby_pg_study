require 'pg'

conn = PG.connect(
  host: 'postgres', # docker-composeで作成したPostgreSQLサービスのコンテナ名を指定します。
  port: 5432, # PostgreSQLのデフォルトポート番号です
  # Gemfileで指定したDBの名前とユーザー名とパスワードです
  dbname: 'test',
  user: 'root',
  password: 'pass'
)

# テーブルを作成します。
conn.exec("CREATE TABLE IF NOT EXISTS test1(
               id SERIAL PRIMARY KEY,
             name VARCHAR(100));"
)
#サンプルデータを1つ作成します。
conn.exec("INSERT INTO test1 VALUES (1, 'test_name') ON CONFLICT (id) DO NOTHING;")
#全てのデータを取得します。
result = conn.exec("SELECT * FROM test1;")
# 表示します。
result.each do |row|
    puts "ID: #{row['id']}, Name: #{row['name']}"
end
conn.close
