# coapZ1
CoAP on Zolertia Z1 with appropriate resources

## Resources Implemented
1. res-battery (*GET* Battery Value)
2. res-name (*GET* Details of the Z1 Mote)
3. res-radio (*GET* LQI/RSSI values of Z1 Mote)
4. rplinfo (*GET* Neighbouring routes and Parents of Z1 Mote)

## Instructions for use

Clone the directory:
<pre>
  $ git clone https://github.com/shantanoo-desai/coapZ1.git
</pre>

In your Contiki-OS repository
```
  make clean all
  make TARGET=z1 er-server.upload
  make z1-reset && make login
```
When login on USB is estabilished press __RST__ button on Z1 Mote to see the Connection Details

## IDENTIFYING MOTES (res-name.c)
(Based on `hello-world.c` resource programmed in Erbium in Contiki-OS.)

Before doing the above steps do the following:
```
cd resources/
gedit res-name.c
```
Change the Node details Option to your Mote details. e.g. `Z1RC1234 Node ID: 1234` accordingly in order to
Identity motes when a large number of such devices are used.

## For Radio Resource (res-radio.c)
do the following to get *LQI* or *RSSI* values respectively:
<pre>
  GET coap://[IPv6 Address of Node]:5683/radio?p=lqi
</pre>

<pre>
  GET coap://[IPv6 Address of Node]:5683/radio?p=rssi
</pre>

## CoAP utilization
Implementations such as *Copper*  or *SMCP* can be used to __GET__ all resources.
