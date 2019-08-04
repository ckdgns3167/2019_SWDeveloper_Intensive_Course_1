package com.urline.vo;

public class PostVO {
    //게시글에 대한 VO
    private Integer userNo = null;
    private Integer postNo = null;
    private String title = null;
    private Integer region = null;
    private String postingDate = null;
    private String contents = null;
    private Integer b_hopefulPoint = null;
    private Integer state = null;
    private String requestTime = null;
    private String howMuch = null;

    public Integer getPostNo() {
        return postNo;
    }

    public Integer getUserNo() {
        return userNo;
    }

    public void setUserNo(Integer userNo) {
        this.userNo = userNo;
    }

    public void setPostNo(Integer postNo) {
        this.postNo = postNo;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getRegion() {
        return region;
    }

    public void setRegion(Integer region) {
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
}
