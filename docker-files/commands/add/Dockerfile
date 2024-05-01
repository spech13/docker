FROM ubuntu

# standart adding file temp.txt
ADD temp.txt /test/

# make the owner of the file temp_2.txt the user myuser

RUN useradd -ms /bin/bash myuser
ADD --chown=myuser:myuser temp2.txt /test/

# grant permissions at read only of file temp_3.txt to myuser2
RUN useradd -ms /bin/bash myuser2
ADD --chown=myuser2:myuser2 --chmod=400 temp3.txt /test/

CMD ["top", "-b"]
