package com.military.demo.mqtt.config;

public interface IMqttSubscriber {
    
    public void subscribeMessage(String message);
    
    public void disconnect();
    
}
