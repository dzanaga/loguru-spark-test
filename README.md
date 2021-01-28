# Testing loguru 0.5.3 on Spark

From the repo:
```
cd spark301
```
To run with latest spark version.

Start the Spark driver container:
```
docker run --rm --name spark-master-301 -h spark-master -e ENABLE_INIT_DAEMON=false -d bde2020/spark-master:3.0.1-hadoop3.2
```

Build app image
```
docker build --rm -t bde/spark-app-301 .
```

Run the application (make sure to declare 
TELEGRAM_CHAT_ID and TELEGRAM_TOKEN env vars either in bash or the script,
random strings should work as anyway it fails before logging):
```
bash run.sh
```

Changing to `loguru==0.3.2` in `requirements.txt` and rebuilding/running will
result in no error.