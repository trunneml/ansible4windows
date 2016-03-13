FROM python:2.7

# Installing Ansible
RUN pip install --no-cache-dir ansible cryptography

# Applying patch for ssh bug: https://github.com/ansible/ansible/issues/13876
COPY ssh.py.patch /tmp/ssh.py.patch
RUN cd /usr/local/lib/python2.7/site-packages/ansible/plugins/connection && \
  patch < /tmp/ssh.py.patch

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
