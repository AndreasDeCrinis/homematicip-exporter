FROM python:3.8.6-slim-buster
ADD exporter.py requirements.txt /
RUN pip3 install -r ./requirements.txt
RUN apt update && apt install git -y
RUN git clone --depth 1 https://github.com/AndreasDeCrinis/homematicip-rest-api.git
RUN cd /homematicip-rest-api && \
    pip install -r requirements.txt && \
    python setup.py install --user
ENTRYPOINT [ "python3", "./exporter.py" ]
