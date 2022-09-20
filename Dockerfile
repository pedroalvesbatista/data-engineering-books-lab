FROM python:3.9

RUN mkdir app
WORKDIR /app
COPY pipeline.conf requirements.txt /app

COPY . /app/
RUN pip install -r requirements.txt

CMD ["python", "extract_mysql_full.py"]
