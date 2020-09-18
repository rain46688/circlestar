package com.nbbang.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.nbbang.common.temp.AESCrypto;

/**
 * Application Lifecycle Listener implementation class CryptorListener
 *
 */
@WebListener
public class CryptorListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public CryptorListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	new AESCrypto();
    }
	
}
