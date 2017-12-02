docker build -t identicons .

docker run -d --name dnmonster amouat/dnmonster:1.0

# we add the argument --link dnmonster:dnmonster to connect the con‐ tainers.
# This is the magic that makes the URL http://dnmonster:8080 addressable
# in the Python code
docker run -d -p 5000:5000 -e "ENV=DEV" --link dnmonster:dnmonster identicons

#docker build -t identidock . && docker run -p 5000:9090 -p 5001:9191 identidock && docker logs -f $(docker-ps identidock)

#docker build -t identidock . && docker run -d -e "ENV=DEV" -p 5000:5000 identidock && docker logs -f $(docker-ps identidock)
