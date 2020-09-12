package onebyn.common;

import javax.servlet.ServletContext;

import javax.servlet.http.HttpSession;

import javax.websocket.HandshakeResponse;

import javax.websocket.server.HandshakeRequest;

import javax.websocket.server.ServerEndpointConfig;

//hettp 세션에서 자바로 세션 아이디를 끌어줘서 인코딩을 시켜줌

public class GetHttpSessionConfigurator extends ServerEndpointConfig.Configurator {

	@Override

	public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {

		HttpSession session = (HttpSession) request.getHttpSession();

		ServletContext ctx = session.getServletContext();

		config.getUserProperties().put(HttpSession.class.getName(), session);

		config.getUserProperties().put(ServletContext.class.getName(), ctx);

	}

}