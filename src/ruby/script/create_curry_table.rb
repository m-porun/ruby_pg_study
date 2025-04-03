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

# テーブル作成
conn.exec("
  CREATE TABLE Curry (
    curry_id      CHAR(4)      NOT NULL,
    curry_name    VARCHAR(32) NOT NULL,
    region        VARCHAR(32)  NOT NULL,
    price         INTEGER ,
    quantity      INTEGER ,
    expiration_date DATE ,
    PRIMARY KEY (curry_id)
  );
")

# トランザクション開始
conn.transaction do
  conn.exec("INSERT INTO Curry VALUES ('0001', 'バターチキンカレー' ,'インド', 900, 8, '2025-04-10');")
  conn.exec("INSERT INTO Curry VALUES ('0002', 'キーマカレー', 'インド', 800, 5, '2025-04-08');")
  conn.exec("INSERT INTO Curry VALUES ('0003', 'レッドカレー', 'タイ', 700, 5, '2025-04-07');")
  conn.exec("INSERT INTO Curry VALUES ('0004', 'グリーンカレー', 'タイ', 700, 3, '2025-04-06');")
  conn.exec("INSERT INTO Curry VALUES ('0005', 'イエローカレー', 'タイ', 800, 3, '2025-04-07');")
  conn.exec("INSERT INTO Curry VALUES ('0006', 'ダル', 'ネパール', 900, 4, '2025-04-06');")
  conn.exec("INSERT INTO Curry VALUES ('0007', 'ソトアヤム', 'インドネシア', 1000, 0, NULL);")
  conn.exec("INSERT INTO Curry VALUES ('0008', 'ナシカリ', 'インドネシア', 900, 2, '2025-04-06');")
  conn.exec("INSERT INTO Curry VALUES ('0009', 'チキンティッカマサラ', 'イギリス', 1000, 3, '2025-04-07');")
  conn.exec("INSERT INTO Curry VALUES ('0010', 'ドライカレー', '日本', 1000, 3, '2025-04-06');")
  conn.exec("INSERT INTO Curry VALUES ('0011', 'スープカレー', '日本', 900, 4, '2025-04-08');")
end
puts 'カレーなるテーブルを作成しました'
conn.close
