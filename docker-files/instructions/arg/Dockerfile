FROM ubuntu

# determinate required build-arg parament
# with name required_username
# when build container

ARG required_username
RUN useradd -ms /bin/bash $required_username

# determinate optional build-arg parament
# with name optional_username
# when build container

ARG optional_username='myuser2'
RUN useradd -ms /bin/bash $optional_username

# example of execution docker command in terminal:
# docker build --build-arg required_username=myuser -t arg-command .
# docker run -it --rm arg-command
# ls home/

CMD ["top", "-b"]