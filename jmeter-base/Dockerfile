FROM java:8
 
RUN wget http://mirror.nbtelecom.com.br/apache//jmeter/binaries/apache-jmeter-3.2.tgz
RUN tar -xvzf apache-jmeter-3.2.tgz
RUN rm apache-jmeter-3.2.tgz

RUN mv apache-jmeter-3.2 /jmeter

ENV JMETER_HOME /jmeter

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH