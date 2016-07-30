import Database.HDBC
import Database.HDBC.Sqlite3
import System.Directory

main = do
  conn <- connectSqlite3 "test.db"
  run conn "CREATE TABLE test (id INTEGER NOT NULL, description VARCHAR(255))" []

  run conn "INSERT INTO test (id, description) VALUES (?, ?)" [toSql (0 :: Integer), toSql "first"]
  commit conn

  res <- quickQuery' conn "SELECT description FROM test WHERE id == 0" []
  mapM print res

  removeFile "test.db"
  disconnect conn
