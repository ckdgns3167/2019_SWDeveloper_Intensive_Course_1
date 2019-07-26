
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

class Download implements Runnable {
	Socket skt = null;

	public Download(Socket skt) {
		this.skt = skt;
	}

	@Override
	public void run() {
		// TODO Auto-generated method stub

		String fle = "01.mp3";
		try(			
				InputStream in = new FileInputStream(fle);
				OutputStream out = skt.getOutputStream();
				){

			int r = 0;
			byte[] buf = new byte[512];

			while ((r = in.read(buf)) != -1) {
				out.write(buf, 0, r);
				out.flush();
			}

			skt.close();

		} catch (Exception e) {
			
		}

	}

}

public class _10_Thread_FileDownS {
	public static void main(String[] args) throws Exception {
		ServerSocket svr = new ServerSocket(1123);
		Thread[] threads = new Thread[3];
		for (int i = 0; i < 3; i++) {
			Socket skt = svr.accept();
			threads[i] = new Thread(new Download(skt));
			threads[i].start();
		}
		threads[0].join();
		threads[1].join();
		threads[2].join();
		svr.close();
	}
}