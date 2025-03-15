FROM python:3.12-slim
# The Dockerfile should copy the portfolio directory and install all the requirements.
# Then it should run the app.py when the container starts.
WORKDIR /app
COPY portfolio/requirements.txt .
RUN pip install -r requirements.txt
COPY portfolio/ . 
CMD ["python", "./app.py"]
