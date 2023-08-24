import json

from kafka import KafkaConsumer

result = {}

consumer = KafkaConsumer(
    bootstrap_servers=["localhost:9092"],
    group_id="demo-group",
    auto_offset_reset="earliest",
    enable_auto_commit=False,
    consumer_timeout_ms=1000,
    value_deserializer=lambda m: json.loads(m.decode("ascii")),
)

consumer.subscribe("trades-prices")

