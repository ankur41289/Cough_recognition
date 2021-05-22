FROM python:3.8.10-buster

WORKDIR '/app'


RUN pip install tensorflow==2.4.0
RUN pip install librosa
RUN pip install numpy
RUN pip install flask
RUN pip install DateTime

COPY . . 

RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1

ENV FLASK_APP /app/coughDetection.py

EXPOSE 5000

#CMD ["flask","run"]
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]