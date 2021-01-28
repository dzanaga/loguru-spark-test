import os
import random

from loguru import logger
from notifiers.logging import NotificationHandler
import pyspark


if __name__ == '__main__':

    TELEGRAM_TOKEN = os.environ.get('TELEGRAM_TOKEN')
    TELEGRAM_CHAT_ID = os.environ.get('TELEGRAM_CHAT_ID')

    logger.info(f"Token: {TELEGRAM_TOKEN}")
    logger.info(f"Chat id: {TELEGRAM_CHAT_ID}")

    params = dict(token=TELEGRAM_TOKEN, chat_id=TELEGRAM_CHAT_ID)
    telegram_handler = NotificationHandler("telegram", defaults=params)
    telegram_sink = logger.add(telegram_handler)

    sc = pyspark.SparkContext(appName="EstimatePi")

    def inside(p):
        logger.info(p)
        x, y = random.random(), random.random()
        return x*x + y*y < 1

    logger.info("Computing Pi")
    NUM_SAMPLES = 100000
    count = sc.parallelize(range(0, NUM_SAMPLES)) \
        .filter(inside).count()

    print("Pi is roughly %f" % (4.0 * count / NUM_SAMPLES))
    sc.stop()
