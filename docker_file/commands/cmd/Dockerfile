FROM ubuntu

# clean and update packages
# python and Django instalation
# Django project creation with name mysite

RUN apt clean && apt update && \
apt install -y python3-pip && \
python3 -m pip install Django && \
django-admin startproject myproject

# run Django server

CMD ["python3", "myproject/manage.py", "runserver", "0.0.0.0:8080"]

EXPOSE 8080

# docker build -t cmd-command .
# docker run -it --rm cmd-command
