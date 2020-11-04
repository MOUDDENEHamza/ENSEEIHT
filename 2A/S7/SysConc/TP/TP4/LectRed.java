// Time-stamp: <02 Apr 2008 16:26 queinnec@enseeiht.fr>

public interface LectRed {

    public void demanderLecture  () throws InterruptedException;
    public void terminerLecture  () throws InterruptedException;
    public void demanderEcriture () throws InterruptedException;
    public void terminerEcriture () throws InterruptedException;
    public String nomStrategie ();
}
