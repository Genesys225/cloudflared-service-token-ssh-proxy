FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl openssh-client openssl gettext-base
# Add cloudflare gpg key
RUN mkdir -p --mode=0755 /usr/share/keyrings
RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
# Add this repo to your apt repositories
RUN echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared jammy main' | tee /etc/apt/sources.list.d/cloudflared.list

WORKDIR /
USER root
RUN mkdir /root/.ssh
RUN touch /root/.ssh/config

# install cloudflared
RUN apt-get update && apt-get install -y cloudflared
COPY ./ssh-client.conf /root/ssh-client.conf
RUN cat /root/.ssh/config
COPY ./entrypoint.sh /root/entrypoint.sh
RUN chmod a+x /root/entrypoint.sh
RUN cat /root/entrypoint.sh

ENTRYPOINT ["/root/entrypoint.sh"]
