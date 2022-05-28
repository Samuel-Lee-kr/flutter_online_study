package com.military.demo.mqtt;

import java.sql.Timestamp;

import com.military.demo.mqtt.config.IMqttSubscriber;
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
public class MqttSubscriber extends MqttConfig implements MqttCallback, IMqttSubscriber {

    private String url = null;
    
    private final String clientId = "samuel_sub";

    private MqttClient mqttClient = null;
    private MqttConnectOptions connectionOptions = null;
    private MemoryPersistence persistence = null;

    private static final Logger logger = LoggerFactory.getLogger(MqttSubscriber.class);
    
    public MqttSubscriber() {
        this.config();
    }

    public MqttSubscriber(String ip, int port, boolean ssl, boolean withUserNamePass) {
        this.config(ip, port, ssl, withUserNamePass);
    }

    @Override
    public void subscribeMessage(String topic) {
        try {
            this.mqttClient.subscribe(topic, getQos());
        } catch (MqttException e) {
            logger.error("MQTT_SUB_ERROR", e);
        }
    }

    @Override
    public void disconnect() {
        try {
            this.mqttClient.disconnect();
        } catch (MqttException e) {
            logger.error("MQTT_SUB_ERROR", e);
        }
    }

    @Override
    public void connectionLost(Throwable cause) {
        logger.info("connection lost");
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        String time = new Timestamp(System.currentTimeMillis()).toString();

        System.out.println();
        System.out.println("======================");
        System.out.println("time : " + time + "\ntopic: " + topic + "\nmessage: " + new String(message.getPayload()));
        System.out.println("======================");
        System.out.println();

        try {
            // ObjectMapper mapper = new ObjectMapper();
            // MqttSub mqttSub = mapper.readValue(message.getPayload(), MqttSub.class);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken token) {
        logger.info("delivery completed");
    }

    @Override
    protected void config(String ip, Integer port, boolean ssl, boolean withUserNamePass) {
        String protocol = ssl ? getTCP() : getSSL();

        this.url = protocol + getIp() + ":" + port;
        this.persistence = new MemoryPersistence();
        this.connectionOptions = new MqttConnectOptions();

        try {
            this.mqttClient = new MqttClient(this.url, this.clientId, this.persistence);
            if (withUserNamePass) {
                if (getPassword() != null) {
                    this.connectionOptions.setPassword(getPassword().toCharArray());
                }
                if (getUsername() != null) {
                    this.connectionOptions.setUserName(getUsername());
                }
            }
            this.mqttClient.connect(this.connectionOptions);
            this.mqttClient.setCallback(this);
        } catch (MqttException e) {
            logger.error("MQTT_SUB_ERROR", e);
        } 
    }

    @Override
    protected void config() {
        this.url = getTCP() + getIp() + ":" + getPort();
        this.persistence = new MemoryPersistence();
        this.connectionOptions = new MqttConnectOptions();

        try {
            this.mqttClient = new MqttClient(this.url, this.clientId, this.persistence);
            this.connectionOptions.setCleanSession(true);
            this.mqttClient.connect(this.connectionOptions);
            this.mqttClient.setCallback(this);
        } catch (MqttException e) {
            logger.error("MQTT_SUB_ERROR", e);
        } 
    }
    
}
