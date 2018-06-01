FROM python:3
COPY Pipfile* /app/
EXPOSE 8000
WORKDIR /app
RUN pip install pipenv flake8 gunicorn
RUN pipenv install --system --dev
COPY . /app
ENTRYPOINT ["gunicorn", "hello:app", "-b", "0.0.0.0:80"]
