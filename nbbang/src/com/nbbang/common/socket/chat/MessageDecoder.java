package com.nbbang.common.socket.chat;

import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
import com.google.gson.Gson;
import com.nbbang.chat.model.vo.Message;

public class MessageDecoder implements Decoder.Text<Message>{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init(EndpointConfig config) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Message decode(String msg) throws DecodeException {
		// TODO Auto-generated method stub
		return new Gson().fromJson(msg,Message.class);
	}

	@Override
	public boolean willDecode(String arg0) {
		// TODO Auto-generated method stub
		return true;
	}

}
