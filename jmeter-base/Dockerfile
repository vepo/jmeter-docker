FROM java:8

RUN mkdir /jmeter \
    && cd /jmeter/ \
    && wget http://mirror.nbtelecom.com.br/apache//jmeter/binaries/apache-jmeter-5.1.1.tgz \
    && tar -xvzf apache-jmeter-5.1.1.tgz \
    && rm apache-jmeter-5.1.1.tgz

ENV JMETER_HOME /jmeter/apache-jmeter-5.1.1/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH
