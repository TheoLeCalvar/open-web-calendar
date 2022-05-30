FROM python:3

EXPOSE 5000
ENV APP_DEBUG=false
ENV CACHE_REQUESTED_URLS_FOR_SECONDS=600

RUN mkdir /app                      \
    && useradd -d /app opencal      \
    && chown -R opencal:opencal /app

USER opencal
WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python", "app.py"]