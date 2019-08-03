package dao;

public class Util {// 사용 빈도가 높기때문에 그냥 함수로 뺀것

	public static int parseInt(String l) {
		try {
			int r = Integer.parseInt(l);
			return r;
		} catch (Exception e) {
			return -1;
		}
	}

	public static String hangleEncoding(String l) {
		if (l == null || l.equals(""))
			return l;
		try {
			byte[] bs = l.getBytes("8859_1");
			l = new String(bs, "utf-8");
		} catch (Exception e) {

		}
		return l;
	}
}
