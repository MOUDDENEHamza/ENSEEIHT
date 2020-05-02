import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Observable;
import java.util.Iterator;

/**
 * The chat class consists on saving messages in ArrayList
 * @author Hamza MOUDDENE
 * @version 1.0
 */
public class Chat extends Observable {

    /**
     * List containing all messages
     */
    private List<Message> messages;

    /**
     * Constructor of chat class
     */
    public Chat() {
        this.messages = new ArrayList<Message>();
    }

    /**
     * Add a message to chat
     * @param m is the message to add
     */
    public void ajouter(Message m) {
        this.messages.add(m);
        this.setChanged();
        this.notifyObservers(m);
    }

    /**
     * Implemnts iterator to allow us use foreach on chat variables
     * @return on iterator of the chat
     */
    public Iterator<Message> iterateur() {
        return this.messages.iterator();
    }
}
