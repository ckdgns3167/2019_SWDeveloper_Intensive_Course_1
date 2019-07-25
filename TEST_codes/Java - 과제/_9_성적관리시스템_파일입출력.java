package HW7_성적관리프로그램;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.util.LinkedList;
import java.util.Scanner;

class Score {
	int Student_num;
	int score;

	Score(int Student_num, int score) {
		this.Student_num = Student_num;
		this.score = score;
	}
}

public class _9_성적관리시스템_파일입출력 {
	static LinkedList<Score> l2 = null;
	static int Student_num = 0;
	static int score = 0;
	static Scanner scan;

	public static void main(String[] args) throws Exception {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		scan = new Scanner(System.in);
		String l = null;
		while (true) {
			System.out.println("[ M E N U ]");
			System.out.println("1. 새 자료");
			System.out.println("2. 자료 입력");
			System.out.println("3. 파일로 저장");
			System.out.println("4. 파일에서 불러오기");
			System.out.print("> ");
			l = br.readLine();

			if (l.equals("1")) {
				l2 = new LinkedList<Score>();
				System.out.println("# 새롭게 리스트를 만들거나 초기화하였습니다.");
			} else if (l.equals("2")) {
				if (l2 == null) {
					System.out.println("# 리스트 인스턴스가 없습니다. 1번을 선택하여 생성해주세요.");
				} else {
					System.out.print("학번 : ");
					Student_num = scan.nextInt();
					System.out.print("점수 : ");
					score = scan.nextInt();
					l2.add(new Score(Student_num, score));
					System.out.println("# 리스트에 학번이 " + Student_num + "인 학생의 점수를 추가했습니다.");
				}
			} else if (l.equals("3")) {
				BufferedWriter bw = new BufferedWriter(new FileWriter("scores.txt"));
				for (int i = 0; i < l2.size(); i++) {
					bw.write((i + 1) + "번 째 학생 정보");
					bw.newLine();
					bw.write("Student_num: " + l2.get(i).Student_num);
					bw.newLine();
					bw.write("score: " + l2.get(i).score);
					bw.newLine();
					System.out.println("# 성적리스트를 파일로 저장하였습니다.");
				}
				bw.close();
			} else if (l.equals("4")) {
				l2 = new LinkedList<Score>();
				BufferedReader br2 = new BufferedReader(new FileReader("scores.txt"));

				String str = null;
				int r = 0;
				boolean flag = false;
				String[] s = null;
				int s_num = 0;
				int sc = 0;
				while ((str = br2.readLine()) != null) {
					if (r % 3 == 1) {
						s = str.split(": ");
						s_num = Integer.parseInt(s[1]);
						flag = true;
						r++;
						continue;
					}
					if (flag) {
						flag = false;
						s = str.split(": ");
						sc = Integer.parseInt(s[1]);
						l2.add(new Score(s_num, sc));
					}
					r++;
				}
				System.out.println("# 저장파일을 불러왔습니다.");
			} else if (l.equals("quit")) {
				System.out.println("# 프로그램을 종료합니다.");
				break;
			}

			if (l.equals("quit"))
				break;
		}
		br.close();
	}
}

/*
 * OutputStream inputStream : 전송단위 char - 바이너리 파일전송 Reader Writer : 전송단위 char -
 * 문자로 된 데이터 전송용 char 2byte이고 유니코드를 지원한다. 거의 모든 문자를 지원한다 때문에 Writer, Reader를 쓴다.
 * 
 * 
 * OutputStreamWriter InputStreamReader 는 char 입출력을 byte입출력으로 전환해 줍니다. (2바이트
 * 입출력을 1바이트로 바궈줍니다.)
 */