package vo;

public class UserVO {
	private Integer userNo = null;
	private String id = null;
	private String pw = null;
	private String eMailId = null;
	private String eMailDomain = null;
	private String phone = null;
	private String nickname = null;
	private Integer point = null;
	private Integer grade = null;
	private Integer sex = null;

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return userNo + " " + id + " " + pw + " " + eMailId + "@" + eMailDomain + " " + phone + " " + nickname + " "
				+ point + " " + grade;
	}

	public Integer getUserNo() {
		return userNo;
	}

	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String geteMailId() {
		return eMailId;
	}

	public void seteMailId(String eMailId) {
		this.eMailId = eMailId;
	}

	public String geteMailDomain() {
		return eMailDomain;
	}

	public void seteMailDomain(String eMailDomain) {
		this.eMailDomain = eMailDomain;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getPoint() {
		return point;
	}

	public void setPoint(Integer point) {
		this.point = point;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

}
