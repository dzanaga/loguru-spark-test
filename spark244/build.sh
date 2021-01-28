docker build --rm -t bde/spark-app-244 .

# start driver container
docker run --rm --name spark-master-244 -h spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-master:2.4.4-hadoop2.7

docker run -it --rm --name loguru_test \
    -e ENABLE_INIT_DAEMON=false \
    -e TELEGRAM_TOKEN=$TELEGRAM_TOKEN \
    -e TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID \
    -e PYSPARK_PYTHON=/usr/bin/python3 \
    --link spark-master:spark-master \
    --entrypoint python3 \
    bde/spark-app-244 \
    app/app/entrypoint.py

# docker run -it --rm --name loguru_test \
#     -e ENABLE_INIT_DAEMON=false \
#     -e TELEGRAM_TOKEN=$TELEGRAM_TOKEN \
#     -e TELEGRAM_CHAT_ID=$TELEGRAM_CHAT_ID \
#     --link spark-master:spark-master \
#     bde/spark-app \
#     sh
