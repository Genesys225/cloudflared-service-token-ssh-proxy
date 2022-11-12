FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl openssh-client openssl expect gettext-base
# Add cloudflare gpg key
RUN mkdir -p --mode=0755 /usr/share/keyrings
RUN curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared buster main' | tee /etc/apt/sources.list.d/cloudflared.list
WORKDIR /
USER root
RUN mkdir /root/.ssh
RUN touch /root/.ssh/config
RUN apt-get update && apt-get install -y cloudflared
COPY ./ssh-client.conf ./ssh-client.conf
RUN cat /root/.ssh/config
COPY ./entrypoint.sh /root/entrypoint.sh
COPY ./expect.sh /root/expect.sh
RUN touch /root/expect-final.sh
RUN chmod a+x /root/entrypoint.sh
RUN chmod a+x /root/expect.sh
RUN chmod a+x /root/expect-final.sh
RUN cat /root/entrypoint.sh
RUN pwd


CMD ["/root/entrypoint.sh"]
