FROM phpkafka

WORKDIR /dist
COPY . /dist/
ENV ESUPDATER_ENVIRONMENT=prod
RUN mkdir -p /home/log/esupdater \
   && composer install

# Do not run start command here, because it means the container is equal consumer process,
# once the consumer was stopped, the container would exit,
# so the workers would not stopped safely.
# CMD ["php", "/dist/esupdater.php", "start"]
