package HW6_socket;

import java.io.*;
import java.net.*;

public class _8_socket_client 
{
	public static void main( String[] args ) throws Exception {
		Socket skt = new Socket("192.168.2.11", 1123);
		ObjectOutputStream out = new ObjectOutputStream( skt.getOutputStream() );
		ObjectInputStream in = new ObjectInputStream( skt.getInputStream() );

		out.writeUTF( args[0] );
		out.flush();

		int code = in.readInt();

		if( code == 404 ) {
			System.out.println("���� �����...");
		}
		else if( code == 200 )
		{
			OutputStream fout = new FileOutputStream( args[0] );

			byte[] buf = new byte[8*1024];
			int len = 0;
			while( ( len = in.read( buf ) ) != -1 ){
				fout.write( buf, 0, len );
			}

			fout.close();

			System.out.println("�ٿ� �Ϸ� ^^*v");
		}

		in.close();
		out.close();
		skt.close();
	}
}