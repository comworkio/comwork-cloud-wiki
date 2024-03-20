# How to create MQTT callback to connect with Scaleway IoT Hub device

While creating your serverless function, you might want to create a callback of type MQTT to send your payload data in real-time.

In this tutorial, we will create a simple serverless function where we will go to send it's invocation result to a Scaleway IoT Hub device.

## Step 1: Create an IoT Hub and device

Hive MQ provides a shared-plan IoT Hub to use for POCs and tutorials. After creating it should look like the following image:

![scaleway iot hub](../../img/faas/scaleway_iot_hub.png)

Go to the Neworks section and take the `endpoint` and download its certificate to use them in the next step.

![scaleway iot hub networks](../../img/faas/scaleway_iot_hub_network.png)

Go to the Devices section, create a device and take the `device ID` and download both of the `Device certificate` and `Device private key certificate` to use them in the next step. 

![scaleway iot hub devices](../../img/faas/scaleway_iot_hub_devices.png)

## Step 2: Add an MQTT callback and create your function

Go to FaaS menu and click on the add button to create a function. Then go to callbacks table and click on the add button to open the callback modal, then choose MQTT type.

Like the following image, put the data we took from the previous step to fill the needed inputs and chose the port, QoS and, subscription topic, and topic. Click on the advanced options button and then the certificates button to reveal the upload certificates needed:

![scaleway_mqtt_callback](../../img/faas/mqtt_scaleway_example.png)

## Step 3: Invoke your function

Go to your functions list and click on the invoke button. It will navigate automatically to the invocations page showing your function result.
