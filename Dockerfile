FROM python:3.6

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

ENTRYPOINT python -m rasa_nlu.train -c nlu_config.yml --data nlu.md -o models --fixed_model_name nlu --project current --verbose && sh -c "$@"

CMD python app.py
