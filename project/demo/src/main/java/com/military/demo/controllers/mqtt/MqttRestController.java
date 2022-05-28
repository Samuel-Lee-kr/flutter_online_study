package com.military.demo.controllers.mqtt;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import com.military.demo.controllers.constants.MqttConstant;
import com.military.demo.mqtt.MqttPublisher;
import com.military.demo.mqtt.MqttSubscriber;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MqttRestController {

    @Autowired
    MqttPublisher publisher;

    @Autowired
    MqttSubscriber subscriber;

    @PostConstruct
    public void init() {
        subscriber.subscribeMessage(MqttConstant.TOPIC_LOOP_TEST_PUB_SUB);
    }

    @RequestMapping(value = MqttConstant.TOPIC_LOOP_TEST_URL, method = RequestMethod.POST)
    public Map<String, Object> index(@RequestBody String data) {
        publisher.publishMessage(MqttConstant.TOPIC_LOOP_TEST_PUB_SUB, data);
        Map<String, Object> res = new HashMap<>();

        res.put("success", true);
        return res;
    }
    
}
