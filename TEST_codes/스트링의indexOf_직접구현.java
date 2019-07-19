package 코드와같이이해하는자바;

class Temp8 {

	public static int indexOf(char[] charArray, char[] charArray2) {
		// TODO Auto-generated method stub
		int idx = -1;
		int count = 0;
		int l1 = charArray.length;
		int l2 = charArray2.length;

		char firstChar = 'a';// 임시 저장 = 그냥 초기화 목적으로 저장해둠.
		if (charArray2.length == 0) {
			idx = 0;
		} else
			firstChar = charArray2[0];

		if (l1 >= l2 && l2 != 0) {
			for (int i = 0; i < l1; i++) {
				if (charArray[i] == firstChar) {
					for (int j = i + 1; j <= i + l2 - 1; j++) {
						if (charArray[j] == charArray2[j - i]) {
							count++;
							if (count == l2 - 1)
								return i;
						} else {
							count = 0;
							break;
						}
					}
				}
			}
		} else
			return idx;
		return idx;
	}

}

public class 스트링의indexOf_직접구현 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int idx = Temp8.indexOf("HelloWorld".toCharArray(), "or".toCharArray());
		System.out.println(idx);
	}

}
