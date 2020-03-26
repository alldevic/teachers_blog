FROM python:3.8

ENV PYTHONUNBUFFERED 1
ENV DJANGO_ENV dev

RUN pip install pipenv
COPY ./Pipfile /Pipfile.lock
RUN if [[ "$DJANGO_ENV" == "dev" ]]; then \
    echo "Install with DEV packages"; \
    pipenv install --system --deploy --ignore-pipfile --dev; \
    pip uninstall pipenv virtualenv virtualenv-clone pip -y; \
    else \
    echo "Install only PROD packages"; \
    pipenv install --system --deploy --ignore-pipfile; \
    pip uninstall pipenv virtualenv virtualenv-clone pip -y; \
    fi
RUN pip --disable-pip-version-check install gunicorn

COPY . /code/
WORKDIR /code/

RUN python manage.py migrate

RUN useradd coderedcms
RUN chown -R coderedcms /code
USER coderedcms

EXPOSE 8000
CMD exec gunicorn mysite.wsgi:application --bind 0.0.0.0:8000 --workers 3
