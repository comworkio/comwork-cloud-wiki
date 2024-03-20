# How to create MQTT callback to connect with Hive MQ cluster

While creating your serverless function, you might want to create a callback of type MQTT to send your payload data in real-time.

In this tutorial, we will create a simple serverless function where we will go to send it's invocation result to a Hive MQ cluster.

## Step 1: Create a Hive MQ cluster

Hive MQ provides a free-tier cluster to use for POCs and tutorials. After creating it should look like the following image:

![hive_mq_cluster](../../img/faas/hivemq_cluster.png)

From this page you need to take the `Cluster URL` to use it as the `endpoint` in the next step.

Go to Web client section and click on `Connect with generated credentials` button. It will show you a modal to create a client.

![hive_mq_web_client](../../img/faas/hivemq_cluster_create_client.png)

From this page you need to take the username and password to use them as the username and password in the next page.

## Step 2: Add an MQTT callback and create your function

Go to FaaS menu and click on the add button to create a function. Then go to callbacks table and click on the add button to open the callback modal, then choose MQTT type.

Like the following image, put the data we took from the previous step to fill the needed inputs and chose the port, QoS and, subscription topic, and topic:

![hive_mq_mqtt_callback](../../img/faas/mqtt_hive_mq_example.png)

## Step 3: Invoke your function

Go to your functions list and click on the invoke button. It will navigate automatically to the invocations page showing your function result.
