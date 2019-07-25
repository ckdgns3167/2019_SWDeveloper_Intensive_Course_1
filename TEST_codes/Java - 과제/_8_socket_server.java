package HW6_socket;

import java.io.*;
import java.net.*;

public class _8_socket_server {
	public static void main( String[] args ) throws Exception {
		ServerSocket svr = new ServerSocket(1123);
		boolean alive = true;
		while( alive ) 
		{
			Socket skt = svr.accept();
			ObjectInputStream in = new ObjectInputStream( skt.getInputStream() );
			ObjectOutputStream out = new ObjectOutputStream( skt.getOutputStream() );

			String fileName = in.readUTF();
			if( fileName.equals("die") ) {
				alive = false;

				out.writeInt( 9 );
				out.flush();
			}
			else 
			{
				File fle = new File( "C:\\A\\" + fileName );
				if( !fle.exists() ) {
					out.writeInt( 404 );
					out.flush();
				}
				else 
				{
					out.writeInt( 200 );
					out.flush();

					InputStream fin = new FileInputStream( "C:\\A\\" + fileName );

					byte[] buf = new byte[8*1024];
					int len = 0;
					while( ( len = fin.read( buf ) ) != -1 ){
						out.write( buf, 0, len );
						out.flush();
					}

					fin.close();
				}
			}

			out.close();
			in.close();
			skt.close();
		}


		svr.close();
	}
}
