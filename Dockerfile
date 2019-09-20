FROM ubuntu:16.04
RUN apt-get update && apt-get install -y curl \
 && curl -sS -o - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add \
 && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
 && apt-get update && apt-get install -y google-chrome-stable \
 && rm -rf /var/lib/apt/lists/* \
 && useradd chrome \
 && mkdir -p /home/chrome/.cache \
 && mkdir -p /home/chrome/.config/google-chrome \
 && touch /home/chrome/.config/google-chrome/First\ Run \
 && chown -R chrome:chrome /home/chrome
USER chrome
ENV HOME /home/chrome
ENTRYPOINT [ "/usr/bin/google-chrome", "--no-sandbox" ]
