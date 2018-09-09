FROM python:3.6

COPY webapp/ /usr/src/app/
WORKDIR /usr/src/app/

RUN chmod +x /usr/src/app/docker_run.sh \
&& pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

CMD /usr/src/app/docker_run.sh
