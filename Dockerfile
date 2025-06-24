FROM python:3.11-slim-buster

WORKDIR /mcp_data_server

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

