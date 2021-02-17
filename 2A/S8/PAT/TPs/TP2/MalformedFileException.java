public class MalformedFileException extends Exception {

    public MalformedFileException (String message) {
        super();
        System.out.println(message + ": Malformed file");
    }
}
