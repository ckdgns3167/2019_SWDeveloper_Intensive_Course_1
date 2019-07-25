import java.net.*;
import java.io.*;

public class TestFileDownS 
{
    public static void main( String[] args ) throws Exception {
		ServerSocket svr = new ServerSocket( 1123 );
        boolean alive = true;
        while( alive ) {
            Socket skt = svr.accept();
			System.out.println( skt.getInetAddress().toString() );

			String fle = "C:\\A\\jdk-6u30-apidocs.zip";
            InputStream in = new FileInputStream( fle );
            OutputStream out = skt.getOutputStream();
            
            int r = 0;
            byte[] buf = new byte[512];

            while( ( r = in.read( buf ) ) != -1 ) {
                out.write( buf, 0, r );
                out.flush();
            }

            out.close();
            in.close();

			skt.close();
        }

		svr.close();
	}
}