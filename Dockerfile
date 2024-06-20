FROM python:3.10

COPY . /home/app
WORKDIR /home/app
RUN mkdir venv && python3 -m venv ./venv && source venv/bin/activate
RUN pip install -r requirements.txt
EXPOSE 8080
ENTRYPOINT ["flask", "--app=main", "run", "--host=0.0.0.0", "--port=8080"]