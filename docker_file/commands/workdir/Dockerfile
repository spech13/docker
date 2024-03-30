FROM ubuntu

# crating myuser

RUN useradd -ms /bin/bash myuser

# swich to myuser directory

WORKDIR /home/myuser

# copying myuserfile.txt to /home/myuser directory

COPY --chown=myuser:myuser --chmod=400 myuserfile.txt .