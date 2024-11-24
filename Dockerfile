FROM python:3.9-slim
COPY app.py /
EXPOSE 80
CMD ["python", "/app.py"]