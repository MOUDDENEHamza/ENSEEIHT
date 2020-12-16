package hdfs;

import java.io.Serializable;

public class Pair<l, r> implements Serializable {
    private l left;
    private r right;

    public Pair(l l, r r) {
        left = l;
        right = r;
    }

    public l getLeft() {
        return left;
    }

    public void setRight(r right) {
        this.right = right;
    }

    public void setLeft(l left) {
        this.left = left;
    }

    public r getRight() {
        return right;
    }

    @Override
    public String toString() {
        return "Pair{" +
                "left=" + left +
                ", right=" + right +
                '}';
    }
}
