package onebyn.common.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import onebyn.common.AES;

/**
 * Application Lifecycle Listener implementation class CrypListener
 *
 */
@WebListener
public class CrypListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public CrypListener() {
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
    	new AES();
    }
	
}
