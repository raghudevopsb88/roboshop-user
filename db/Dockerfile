FROM docker.io/mongo:8.0.10-noble
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/* \
    && rm -f /usr/local/bin/gosu \
        /usr/bin/bsondump /usr/bin/mongodump /usr/bin/mongoexport \
        /usr/bin/mongofiles /usr/bin/mongoimport /usr/bin/mongorestore \
        /usr/bin/mongostat /usr/bin/mongotop
COPY master-data.js /db/master-data.js
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["bash", "/run.sh"]
