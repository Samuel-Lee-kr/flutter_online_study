package com.military.demo.mqtt.config;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class MqttConfig {
    
    private String ip = "broker.hivemq.com";
    private int qos = 1;
    private boolean hasSSL = false;
    private int port = 1883;
    private String username = "samuel_demo";
    private String password = "samuel_demo";
    private String TCP = "tcp://";
    private String SSL = "ssl://";

    protected abstract void config(String ip, Integer port, boolean ssl, boolean withUserNamePass);

    protected abstract void config();

}
