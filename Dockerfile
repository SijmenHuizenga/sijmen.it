FROM nginx

RUN apt-get update && apt-get install hugo

COPY . /site

ENV BASEPATH="https://sijmen.it"

CMD ["bash", "-c", "hugo -s /site -d /usr/share/nginx/html/ -b $BASEPATH && nginx -g \"daemon off;\""]
