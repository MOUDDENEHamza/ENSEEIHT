package ordo;

import formats.Format;
import map.Mapper;

import java.rmi.Remote;
import java.rmi.RemoteException;

public interface Worker extends Remote {
	public void runMap (Mapper m, Format reader, Format writer, CallBack cb) throws RemoteException;
}
