package TP2;

public class SFicheImpl implements SFiche {

    private String nom;
    private String email;

    public SFicheImpl(String nom, String email) {
        this.nom = nom;
        this.email = email;
    }

    @Override
    public String getNom() {
        return this.nom;
    }

    @Override
    public String getEmail() {
        return this.email;
    }
}
