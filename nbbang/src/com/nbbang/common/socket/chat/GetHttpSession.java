package com.nbbang.common.socket.chat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;

public class GetHttpSession extends ServerEndpointConfig.Configurator {
	@Override
	public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
		//소켓에서 값을 사용하기 위해 modifyHandshake를 재정의하여 HandShake과정에서 HttpSession을 Map에 넣음
		HttpSession session = (HttpSession) request.getHttpSession();
		ServletContext ctx = session.getServletContext();
		config.getUserProperties().put(HttpSession.class.getName(), session);
	}
}
