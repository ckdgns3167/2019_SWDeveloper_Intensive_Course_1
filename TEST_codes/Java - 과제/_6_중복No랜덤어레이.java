package 제주과제5_Collection적용;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

class HW {
	static int[] randomArray(int num, int range) {// no collection
		int[] returnArray = new int[num];
		int insertedIdx = 0;
		boolean flag = true;
		while (insertedIdx != returnArray.length) {
			int intValue = (int) (Math.random() * 100) + 1;
			for (int i = 0; i < returnArray.length; i++) {
				if (returnArray[i] == intValue) {
					flag = false;
					break;
				}
			}
			if (flag) {
				returnArray[insertedIdx++] = intValue;
			} else
				flag = true;
		}
		return returnArray;

	}

//1 2 3 4 5 
	static List<Integer> randomArray2(int num, int range) {
		List<Integer> l = new ArrayList<Integer>();
		Set<Integer> s = new TreeSet<Integer>();
		int count = 0;
		while (s.size() < num) {// 중복없이 num 개수가 될 때 까지 Set에 add
			s.add((int) ((Math.random() * 100) + 1));
		}
		l.addAll(s);
		return l;// collection

	}
}

public class _6_중복No랜덤어레이 {

	/*
	 * 2가지 이상의 다른 방법으로 구현하기 1가지 방법에는 Collection 사용 금지
	 * 
	 */
	public static void main(String[] args) {
//		 TODO Auto-generated method stub
		int[] rl = HW.randomArray(10, 100);
		for (int i = 0; i < rl.length; i++) {
			System.out.print(rl[i] + " ");
		}
		System.out.println();
		List<Integer> rl2 = HW.randomArray2(10, 100);
		for (int i = 0; i < rl2.size(); i++) {
			System.out.print(rl2.get(i) + " ");
		}
	}

}
