package hdfs;

import java.io.Serializable;
import java.net.InetAddress;
import java.util.Objects;

public class ServerRecord implements Serializable {
    private String name;
    private InetAddress address;
    private int port;

    public ServerRecord(String name, InetAddress address, int port) {
        this.name = name;
        this.address = address;
        this.port = port;
    }

    public ServerRecord(ServerRecord sr) {
        this.name = sr.getName();
        this.address = sr.getAddress();
        this.port = sr.getPort();
    }

    public String getName() {
        return name;
    }

    public int getPort() {
        return port;
    }

    public InetAddress getAddress() {
        return address;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ServerRecord that = (ServerRecord) o;
        return port == that.port &&
                Objects.equals(name, that.name) &&
                Objects.equals(address, that.address);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, address, port);
    }

    @Override
    public String toString() {
        return "ServerRecord{" +
                "name='" + name + '\'' +
                ", address=" + address +
                ", port=" + port +
                '}';
    }
}