FROM python:2.7

# Installing Ansible
RUN pip install --no-cache-dir ansible cryptography

# Configure Ansible
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_INVENTORY /ansible/hosts
ENV SSH_KEYS /ansible/keys

# Preparing ssh-agent with an entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

RUN mkdir /ansible
WORKDIR /ansible

# Configure entrypoint
ENTRYPOINT ["/entrypoint.sh"]
