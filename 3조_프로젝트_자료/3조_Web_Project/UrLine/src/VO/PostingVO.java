package VO;

public class PostingVO {
	private Integer userNO = null;
	private String nickName = null;
	private Integer grade = null;
	private String title = null;
	private String region = null;
	private String postingDate = null;
	private String contents = null;
	private Integer b_hopefulPoint = null;// buyer�������Ʈ
	private Integer state = null;
	private String requestTime = null;// ��Ź �ð�
	private String howMuch = null;// ��Ź �ð� ���� �󸶳� ��ٷ��� �ϴ���

	public Integer getUserNO() {
		return userNO;
	}

	public void setUserNO(Integer userNO) {
		this.userNO = userNO;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getPostingDate() {
		return postingDate;
	}

	public void setPostingDate(String postingDate) {
		this.postingDate = postingDate;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Integer getB_hopefulPoint() {
		return b_hopefulPoint;
	}

	public void setB_hopefulPoint(Integer b_hopefulPoint) {
		this.b_hopefulPoint = b_hopefulPoint;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(String requestTime) {
		this.requestTime = requestTime;
	}

	public String getHowMuch() {
		return howMuch;
	}

	public void setHowMuch(String howMuch) {
		this.howMuch = howMuch;
	}

	public String getValidTime() {
		return validTime;
	}

	public void setValidTime(String validTime) {
		this.validTime = validTime;
	}

	// �Խù��� ���� �ð� = ���� �ð� : �ð��� �ڳ��� �Խù����� ����
	// ��, �� �̻� �������� ����(�Խù� �ۼ��ڰ� �ۼ��� ��, �̶����� �����
	// ���ؾ߰ڴ� �ϰ� ������ �� �ð����� ���� �ð��� �ǹ���)
	private String validTime = null;

}
