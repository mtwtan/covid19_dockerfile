FROM ubuntu:20.10

RUN mkdir -p /usr/share/application

RUN useradd covid19

ENV HOME=/usr/share/application
ENV APP_HOME=/usr/share/application/django

RUN mkdir -p $APP_HOME

WORKDIR $APP_HOME

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
#ENV DEBIAN_FRONTEND=noninteractive

# install psycopg2 dependencies
RUN apt-get -y update && apt-get -y install gcc python3 python3-dev python3-pip libmariadb-dev-compat libmariadb-dev libmariadbd-dev libmariadb-dev curl telnet

COPY requirements.txt $APP_HOME
COPY startgunicorn.sh $APP_HOME
COPY stopgunicorn.sh $APP_HOME

RUN pip install -r requirements.txt

COPY covid19_django/ $APP_HOME/
COPY git/covid19_django_docker/ $APP_HOME

RUN chown -R covid19:covid19 $APP_HOME && chmod a+x startgunicorn.sh && chmod a+x stopgunicorn.sh

USER covid19

EXPOSE 8000

ENV PATH /usr/share/application/django/:$PATH

ENTRYPOINT startgunicorn.sh

#CMD ["gunicorn", "--bind", ":8000", "--workers", "3", "--daemon", "covid19docker.wsgi"]
