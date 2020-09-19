package com.nbbang.common.socket.chat;

import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
import com.google.gson.Gson;
import com.nbbang.chat.model.vo.Message;

public class MessageEncoder implements Encoder.Text<Message>{

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
		return new Gson().toJson(msg);
	}

}
