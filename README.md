JMeter & Docker
===

This is a simple demo of running a JMeter with Docker. The script `exec-jmeter.sh` creates a JMeter master and n JMeter slaves. 

To create 4 instances:

```
./exec-jmeter.sh 4
```

The script will run all `scripts/*.jmx` files.