# ruby-amq

#### ruby 2.2.[2]
#### ActiveMQ 5.13 

### Test scripts
1. send msg to vitual topic
```
PN_TRACE_FRM=1 ruby send_ssl.rb -a amqp://<host>:5672/"topic://VirtualTopic.test.topic1" "{key:value}"
```
2. consume msg from queue
```
PN_TRACE_FRM=1 ruby recv_ssl.rb amqp://<host>:5672/"queue://Consumer.aa.VirtualTopic.test.>"
PN_TRACE_FRM=1 ruby recv_ssl.rb amqp://<host>:5672/"queue://Consumer.bb.VirtualTopic.test.>"
```
3. view activemq admin console
http://<host>:8161/admin

[Apache ActiveMQ ™ -- Virtual Destinations](http://activemq.apache.org/virtual-destinations.html)



