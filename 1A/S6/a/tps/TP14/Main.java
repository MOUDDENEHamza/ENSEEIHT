public class Main {

    public static void main(String[] args) {
        String[] pseudos = new String[] { "Moi", "Toi", "Lui" };
        Chat chat = new Chat();

        int x = 10;
        int y = 10;
        for (String nom : pseudos) {
            new ChatSwing(chat, nom).setLocation(x, y);
            x += 400;
            y += 200;
        }
    }
}