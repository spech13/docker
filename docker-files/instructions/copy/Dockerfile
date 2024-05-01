FROM ubuntu

# standart copying of file1.txt to test directory

COPY file1.txt /test/

# owner creating for file2.txt
# copying of file2.txt to test directory

RUN useradd -ms /bin/bash myuser1
COPY --chown=myuser1:myuser1  file2.txt /test/

# owner creating for file3.txt
# copying file3.txt to test directory
# grant read only permissions for owner file3.txt

RUN useradd -ms /bin/bash myuser2
COPY --chown=myuser2:myuser2 --chmod=400 file3.txt /test/

CMD ["top", "-b"]