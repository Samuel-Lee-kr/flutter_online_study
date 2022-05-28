package com.military.demo.mqtt;

import com.military.demo.mqtt.config.IMqttPublisher;
import com.military.demo.mqtt.config.MqttConfig;

import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class MqttPublisher extends MqttConfig implements MqttCallback, IMqttPublisher {

    private String url = null;

    private final String clientId = "samuel_pub";

    private MqttClient mqttClient = null;
    private MqttConnectOptions connectOptions = null;
    private MemoryPersistence persistence = null;

    private static final Logger logger = LoggerFactory.getLogger(MqttPublisher.class);

    private MqttPublisher() {
        this.config();
    }

    private MqttPublisher(String ip, int port, boolean ssl, boolean withUserNamePass) {
        this.config(ip, port, ssl, withUserNamePass);
    }

    public static MqttPublisher getInstance() {
        return new MqttPublisher();
    }

    public static MqttPublisher getInstance(String ip, int port, boolean ssl, boolean withUserNamePass) {
        return new MqttPublisher(ip, port, ssl, withUserNamePass);
    }

    @Override
    public void publishMessage(String topic, String message) {
        try {
            MqttMessage mqttMessage = new MqttMessage(message.getBytes());
            mqttMessage.setQos(getQos());
            this.mqttClient.publish(topic, mqttMessage);
        } catch (MqttException e) {
            logger.error("MQTT_PUB_ERROR", e);
        }
    }

    @Override
    public void disconnect() {
        try {
            this.mqttClient.disconnect();
        } catch (MqttException e) {
            logger.error("MQTT_PUB_ERROR", e);
        }
    }

    @Override
    public void connectionLost(Throwable cause) {
        logger.info("connection lost");
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        logger.info("message Arrived");
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {
        logger.info("delivery completed");
    }

    @Override
    protected void config(String ip, Integer port, boolean ssl, boolean withUserNamePass) {
        String protocol = ssl ? getTCP() : getSSL();

        this.url = protocol + getIp() + ":" + getPort();
        this.persistence = new MemoryPersistence();
        this.connectOptions = new MqttConnectOptions();

        try {
            this.mqttClient = new MqttClient(this.url, this.clientId, this.persistence);
            this.connectOptions.setCleanSession(true);
            if (withUserNamePass) {
                if (getPassword() != null) {
                    this.connectOptions.setPassword(getPassword().toCharArray());
                }

                if (getUsername() != null) {
                    this.connectOptions.setUserName(getUsername());
                }

                this.mqttClient.connect(this.connectOptions);
                this.mqttClient.setCallback(this);
            }
        } catch (MqttException e) {
            logger.error("MQTT_PUB_ERROR", e);
        }
    }

    @Override
    protected void config() {
        this.url = getTCP() + getIp() + ":" + getPort();
        this.persistence = new MemoryPersistence();
        this.connectOptions = new MqttConnectOptions();

        try {
            this.mqttClient = new MqttClient(this.url, this.clientId, this.persistence);
            this.connectOptions.setCleanSession(true);
            this.mqttClient.connect(this.connectOptions);
            this.mqttClient.setCallback(this);
        } catch (MqttException e) {
            logger.error("MQTT_PUB_ERROR", e);
        }
    }

}
