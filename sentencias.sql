-- CREAR STREAM
CREATE STREAM stream_trades (price DOUBLE, symbol STRING, timestamp STRING, volume DOUBLE) WITH (kafka_topic='trades-prices', value_format='json');

-- CREAR TABLA PARA PROMEDIO DE PRECIOS
create table avg_prices as select symbol, avg(price) prom from stream_trades 
group by symbol emit changes;

-- CREAR TABLA PARA CONTEO DE TRANSACCIONES
create table count_symbol as select symbol, count(symbol) from stream_trades  
group by symbol emit changes;

-- CREAR TABLA PARA MAXIMO PRECIO
create table max_prices as select symbol, max(price) max_price from stream_trades  
group by symbol emit changes;

-- CREAR TABLA PARA MINIMO PRECIO
create table min_prices as select symbol, min(price) min_price from stream_trades  
group by symbol emit changes;

-- SENTENCIAS DE CONSULTA 

-- PROMEDIO PONDERADO
select * from avg_prices;

-- NUMERO DE TRANSACCIONES
select * from count_symbol;

-- MAXIMO PRECIO
select * from max_prices;

-- MINIMO PRECIO
select * from min_prices;