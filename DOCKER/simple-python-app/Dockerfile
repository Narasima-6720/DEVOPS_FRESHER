FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN apt-get update && apt-get install python3 python3-pip -y
ENTRYPOINT ["python3"]
CMD ["app.py"]

