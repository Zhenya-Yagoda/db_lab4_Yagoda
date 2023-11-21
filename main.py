import psycopg2
import matplotlib.pyplot as plt

username = 'postgres'
password = '1234567890'
database = 'movie'
host = 'localhost'
port = '5432'

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(conn))

# -- 1. кількість фільмів в кожного сценариста
query_1 = '''SELECT writer.name_w, COUNT(has.id_movie) AS movie_count FROM writer LEFT JOIN has ON writer.id_writer = has.id_writer GROUP BY writer.name_w;'''

# -- 2. кількість фільмів в кожного режисера
query_2 = '''SELECT director.name_d, COUNT(movie.id_movie) AS movie_count FROM director LEFT JOIN movie ON director.id_director = movie.id_director GROUP BY director.name_d;'''

# --3.список режисерів та середніх рейтингів їхніх фільмів на IMDb
query_3 = '''SELECT director.name_d,AVG(movie.score) AS avg_imdb_score FROM director JOIN movie ON director.id_director = movie.id_director GROUP BY director.id_director;'''

with conn:
                       
    print ("Database opened successfully")
    #створюємо обєкт типу курсор
    cur = conn.cursor()
    print ("\n1. кількість фільмів в кожного сценариста")
    cur.execute(query_1)
    for row in cur:
        print(row)

    print ("\n2. кількість фільмів в кожного режисера")
    cur.execute(query_2)
    for row in cur:
        print(row)    
    
    print ("\n3.список режисерів та середніх рейтингів їхніх фільмів на IMDb")
    cur.execute(query_3)
    for row in cur:
        print(row)