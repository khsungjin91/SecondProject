package board.bean;

import java.sql.Timestamp;

public class noticeDTO {
	
	private int n_num;
	private String n_subject;
	private String n_content;
	private Timestamp n_reg;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_subject() {
		return n_subject;
	}
	public void setN_subject(String n_subject) {
		this.n_subject = n_subject;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Timestamp getN_reg() {
		return n_reg;
	}
	public void setN_reg(Timestamp n_reg) {
		this.n_reg = n_reg;
	}
	
	
	
	
}
