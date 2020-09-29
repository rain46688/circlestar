package com.nbbang.common.socket.chat;

import java.io.IOException;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;
import com.nbbang.chat.model.vo.Message;

public class MessageEncoder implements Encoder.Text<Message> {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init(EndpointConfig config) {
		// TODO Auto-generated method stub

	}

	@Override
	public String encode(Message msg) throws EncodeException {
		// TODO Auto-generated method stub

		// java객체를 json객체로
		 return new Gson().toJson(msg);
		
//		String ms = "";
//		try {
//			ms = new ObjectMapper().writeValueAsString(msg);
//			System.out.println("ms : "+ms);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		return ms;
		
		
	}
}
