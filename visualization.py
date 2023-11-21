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
    cur = conn.cursor()

cur.execute(query_1)
vendors = []
total = []
for row in cur:
    vendors.append(row[0])
    total.append(row[1])
x_range = range(len(vendors))

cur.execute(query_2)
vendors2 = []
total2 = []
for row in cur:
    vendors2.append(row[0])
    total2.append(row[1])
x_range2 = range(len(vendors2))

cur.execute(query_3)
quantity = []
item_price = []
for row in cur:
    quantity.append(row[0])
    item_price.append(row[1])
# -- 1. кількість фільмів в кожного сценариста 
plt.figure(figsize=(12, 6))
plt.bar(x_range, total, width=0.5)
plt.title('Кількість фільмів в кожного сценариста ')
plt.xlabel('Сценаристи')
plt.xticks(x_range, vendors)
plt.ylabel('Кількість')
plt.show()

# -- 2. кількість фільмів в кожного режисера 
plt.pie(total2, labels=vendors2, autopct='%1.1f%%')
plt.title('Частка фільмів кожного режисера')
plt.show()

# --3.список режисерів та середніх рейтингів їхніх фільмів на IMDb 
figure, (graph_ax) = plt.subplots(1, 1, figsize=(12, 6))
graph_ax.plot(quantity, item_price, marker='o')
graph_ax.set_xlabel('Режисери')
graph_ax.set_ylabel('Середній рейтинг фільмів на IMDb')
graph_ax.set_title('Графік залежності режисерів та середніх рейтингів їхніх фільмів на IMDb')
for qnt, price in zip(quantity, item_price):
    graph_ax.annotate(price, xy=(qnt, price), xytext=(7, 2), textcoords='offset points')    

mng = plt.get_current_fig_manager()
plt.show()

# разом 
fig, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3, figsize=(14, 5))  
# -- 1. кількість фільмів в кожного сценариста 
bar = bar_ax.bar(x_range, total, label='Total')
bar_ax.bar_label(bar, label_type='center') 
bar_ax.set_xticks(x_range)
bar_ax.set_xticklabels(vendors, rotation=45, ha='right') 
bar_ax.set_xlabel('Сценаристи')
bar_ax.set_ylabel('Кількість')
bar_ax.set_title('Кількість фільмів в кожного сценариста ')

# -- 2. кількість фільмів в кожного режисера 
pie_ax.pie(total2, labels=vendors2, autopct='%1.1f%%', startangle=90, counterclock=False)
pie_ax.set_title('Частка фільмів кожного режисера')

# -- 3. список режисерів та середніх рейтингів їхніх фільмів на IMDb 
mark_color = 'blue'
graph_ax.plot(quantity, item_price, color=mark_color, marker='o', markersize=8)
graph_ax.set_xticks(range(len(quantity)))
graph_ax.set_xticklabels(quantity, rotation=45, ha='right')  
graph_ax.set_xlabel('Режисери')
graph_ax.set_ylabel('Середній рейтинг фільмів на IMDb')
graph_ax.set_title('Графік залежності режисерів та середніх рейтингів їхніх фільмів на IMDb')

plt.tight_layout()
plt.show()