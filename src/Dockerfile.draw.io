FROM debian:10

RUN apt update
RUN apt install -y libasound2 libgbm1 xvfb
ADD https://github.com/jgraph/drawio-desktop/releases/download/v15.4.0/drawio-amd64-15.4.0.deb .
RUN apt install -y ./drawio-amd64-15.4.0.deb

WORKDIR /data

CMD xvfb-run --server-num 44 drawio -x -f png -o docs/images/ docs/diagrams/ --no-sandbox

# docker run -itd -v /home/jc2/documentation/:/data --name deb debian:10
# docker exec -it deb /bin/bash
# apt update
# apt install -y libasound2 libgbm1 xvfb
# apt install -y ./drawio-amd64-15.4.0.deb
# xvfb-run --server-num 44 drawio -x -f png -o docs/images/ docs/diagrams/ --no-sandbox
# docker build -t juancamiloceron/drawio-exporter:latest -f src/Dockerfile.draw.io .
# docker run -v $PWD:/data --rm juancamiloceron/drawio-exporter:latest