# docker build --rm -t bde/spark-app-301 .

# run this only once to start the master container
# docker run --rm --name spark-master-301 -h spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-master:3.0.1-hadoop3.2

docker run -it --rm --name loguru_test \
    -e ENABLE_INIT_DAEMON=false \
    -e TELEGRAM_TOKEN=$TELEGRAM_TOKEN \
    -e TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID \
    -e PYSPARK_PYTHON=/usr/bin/python3 \
    --link spark-master:spark-master \
    --entrypoint python3 \
    bde/spark-app-301 \
    app/app/entrypoint.py
