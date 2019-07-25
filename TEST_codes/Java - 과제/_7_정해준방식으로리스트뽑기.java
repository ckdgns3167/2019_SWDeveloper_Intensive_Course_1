package 제주과제5_Collection적용;

import java.util.*;

public class _7_정해준방식으로리스트뽑기 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> ls = new ArrayList<String>();
		ls.add("apple");
		ls.add("banana");
		ls.add("orange");
		ls.add("kiwi");

		String l = 정해준방식으로리스트뽑기.collectionString(ls);
		System.out.println(l);
	}

	/*
	 * "[]" "['apple']" "['apple', 'banana']"
	 */
	private static String collectionString(List<String> ls) {
		// TODO Auto-generated method stub
		String answer = "";
		StringBuffer sb = new StringBuffer();
		int count = 0;
		for (String i : ls) {
			sb.append("'").append(i).append("'");
			count++;
			if (count != ls.size()) {
				sb.append(", ");
			}
		}
		answer = sb.toString();
		return "[" + answer + "]";
	}

}
