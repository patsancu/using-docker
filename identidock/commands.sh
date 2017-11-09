docker run -d -p 5000:5000 -v "$(pwd)"/app:/app identidock

docker build -t identidock . && docker run -p 5000:9090 -p 5001:9191 identidock
