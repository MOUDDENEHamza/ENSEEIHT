
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.ActiveMQConnection;
import org.apache.activemq.ActiveMQConnectionFactory;

public class HelloTopic {

    private static String url = ActiveMQConnection.DEFAULT_BROKER_URL;
    private static String subject = "MyTopic";
    
    public static void main(String argv[]) {

	try {
		
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url);
		
		Connection connection = connectionFactory.createConnection();
		connection.start();
		
		Session session = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
		
		Destination destination = session.createTopic(subject);
		
		MessageProducer producer = session.createProducer(destination);
		MessageConsumer consumer = session.createConsumer(destination);

		MessageListener listener = new MessageListener() {
            		public void onMessage(Message msg) {
            			try {
        				TextMessage textmsg = (TextMessage)msg;
        				System.out.println("received : "+textmsg.getText());
        			} catch (Exception ex) {
        				ex.printStackTrace();
        			}
            		}
		};
		
		consumer.setMessageListener(listener);

		TextMessage message = session.createTextMessage("Hello welcome to ActiveMQ!");
		producer.send(message);
		System.out.println("Sentage '" + message.getText() + "'");
		Thread.sleep(1000);

		connection.close();

      	} catch (Exception ex) {
		ex.printStackTrace();
		return;
	}

	
    }
}
