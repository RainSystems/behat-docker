FROM php:7-alpine
RUN wget https://github.com/Behat/Behat/archive/v3.1.0.tar.gz
RUN tar zxvpf v3.1.0.tar.gz
WORKDIR Behat-3.1.0
RUN curl -s http://getcomposer.org/installer | php
RUN php composer.phar install
RUN php composer.phar require --dev behat/mink-extension=2.2
RUN php composer.phar require --dev behat/mink-selenium2-driver=1.3.1
ENV PATH $PATH:/Behat-3.1.0/bin
RUN rm /v3.1.0.tar.gz
WORKDIR /app
VOLUME /app
ENTRYPOINT ["behat"]