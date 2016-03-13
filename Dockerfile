FROM python:2.7

RUN pip install --no-cache-dir ansible

RUN mkdir -p /etc/ansible
COPY ansible.cfg /etc/ansible/ansible.cfg

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN useradd -lms /bin/bash ansible
WORKDIR /home/ansible
USER ansible

ENTRYPOINT ["/entrypoint.sh"]
