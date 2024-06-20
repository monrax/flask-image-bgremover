FROM python:3.12-alpine

COPY . /home/app
WORKDIR /home/app
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT ["flask", "--app=main", "run", "--host=0.0.0.0", "--port=8080"]