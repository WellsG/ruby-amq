#!/usr/bin/ruby
## usage: PN_TRACE_FRM=1 bundle exec ruby test_send.rb
ENV['QPID_SSL_CERT_DB'] ||= '/etc/pki/nssdb'
ENV['QPID_SSL_CERT_NAME'] ||= "" #<nick name>
#
require 'qpid_messaging'
#
broker  = ARGV[1] || "amqp:<hostname>:5672"
options = ARGV[2] || {transport:'ssl'}
#p 'connect to umb ...'
connection = Qpid::Messaging::Connection.new :url => broker, :options => options
connection.open
session = connection.create_session
receiver_queue = Qpid::Messaging::Address.new("Consumer.aa.VirtualTopic.topic.test1.>;{create:receiver, node:{type: queue, durable: True}, link:{durable: True,reliability: at-least-once}}")
recv = session.create_receiver receiver_queue
recv.capacity = 50
##response = recv.fetch

# Neccessary to use timeout since ruby does not yet
# use nonblocking IO. Othewise, sigint/term/etc won't
# be caught.
rec = session.next_receiver(Qpid::Messaging::Duration::MINUTE)
message = rec.fetch

p message.content()
session.acknowledge

connection.close

