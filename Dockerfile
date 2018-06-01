FROM python:3
COPY Pipfile* /app/
WORKDIR /app
RUN pipenv install --system --dev
COPY . /app
ENTRYPOINT ["FLAKS_APP=hello.py flask run"]
