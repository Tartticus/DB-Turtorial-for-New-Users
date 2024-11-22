# Load the DuckDB library
library(duckdb)

# Connect to the DuckDB database
con <- dbConnect(duckdb::duckdb(), dbdir = "music.db")

# Execute the query and retrieve the results into a data frame
df <- dbGetQuery(con, "
SELECT 
  s.id, 
  s.date_created, 
  s.song, 
  s.artist, 
  u.\"real_nigga?\" 
FROM songs s
INNER JOIN usernames u 
ON s.date_created = u.date_created 
WHERE u.\"real_nigga?\" = 'Y';
")

# Print the resulting data frame
print(df)

# Disconnect from the DuckDB database
dbDisconnect(con)
