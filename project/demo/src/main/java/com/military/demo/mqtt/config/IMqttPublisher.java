package com.military.demo.mqtt.config;

public interface IMqttPublisher {

    public void publishMessage(String topic, String message);

    public void disconnect();
    
}
