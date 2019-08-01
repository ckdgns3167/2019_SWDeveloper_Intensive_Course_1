package main;

import java.util.StringTokenizer;

public class Test107 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String l = "올해당췌 이것은 글을 쓴 내용에 해당하는 #해쉬태그 문장입니다.";

		/*
		 	문장에서 공백을 기준으로 하나씩 잘라서 볼 때 사용한다.
		 	String 의 split 함수도 비슷한 기능을 하지만 이쪽이 더 가볍다.
		 */
		StringTokenizer st = new StringTokenizer(l);
		while (st.hasMoreTokens()) {
			String tkn = st.nextToken();
			System.out.println(tkn.startsWith("해당"));//해당이란 단어가 있는 것을 확인할 수 있음.
			if(tkn.charAt(0)=='#') {
				System.out.println(tkn);
			}
		}
	}

}
