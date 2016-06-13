package main.bean;

public class HeadDto {
	
	private int no; 
	private String email,nickname,join,profile; 
	private long total_ch,total_re,total;
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getJoin() {
		return join;
	}
	public void setJoin(String join) {
		this.join = join;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public long getTotal_ch() {
		return total_ch;
	}
	public void setTotal_ch(long total_ch) {
		this.total_ch = total_ch;
	}
	public long getTotal_re() {
		return total_re;
	}
	public void setTotal_re(long total_re) {
		this.total_re = total_re;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	
	
	
}
