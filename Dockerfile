FROM debian as builder
ENV HUGOVERSION=0.53
ENV BASEPATH="https://sijmen.it"

RUN apt-get update && apt-get install -y wget
RUN wget -q https://github.com/gohugoio/hugo/releases/download/v${HUGOVERSION}/hugo_${HUGOVERSION}_Linux-64bit.tar.gz
RUN tar -xzf hugo_${HUGOVERSION}_Linux-64bit.tar.gz
RUN ./hugo version

COPY . /site
RUN ./hugo -s /site -b $BASEPATH

FROM nginx
COPY --from=builder /site/public/ /usr/share/nginx/html/