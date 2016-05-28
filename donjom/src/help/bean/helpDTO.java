package help.bean;

import java.sql.Timestamp;

public class helpDTO {
	
	private int h_no ;
	private String h_subject ;
	private String h_content ;
	private String h_category ;
	private Timestamp  h_reg;
	
	
	public String getH_category() {
		return h_category;
	}
	public void setH_category(String h_category) {
		this.h_category = h_category;
	}
	public int getH_no() {
		return h_no;
	}
	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	public String getH_subject() {
		return h_subject;
	}
	public void setH_subject(String h_subject) {
		this.h_subject = h_subject;
	}
	public String getH_content() {
		return h_content;
	}
	public void setH_content(String h_content) {
		this.h_content = h_content;
	}


	public Timestamp getH_reg() {
		return h_reg;
	}
	public void setH_reg(Timestamp h_reg) {
		this.h_reg = h_reg;
	}

	
}
