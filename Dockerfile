FROM python:3.7

ENV VIRTUAL_ENV=/opt/venv
RUN python -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

EXPOSE 8888

COPY ./Requirements.txt /Requirements.txt

WORKDIR /

RUN pip3 install -r Requirements.txt

COPY . /

CMD ["ddtrace-run", "python", "app/app.py"]
