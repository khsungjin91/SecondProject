package board.bean;

import java.sql.Timestamp;

public class infoBDTO {
	private int i_num;
	private String i_subject;
	private String i_content;
	private String category;
	private Timestamp i_reg;
	
	public int getI_num() {
		return i_num;
	}
	public void setI_num(int i_num) {
		this.i_num = i_num;
	}
	public String getI_subject() {
		return i_subject;
	}
	public void setI_subject(String i_subject) {
		this.i_subject = i_subject;
	}
	public String getI_content() {
		return i_content;
	}
	public void setI_content(String i_content) {
		this.i_content = i_content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Timestamp getI_reg() {
		return i_reg;
	}
	public void setI_reg(Timestamp i_reg) {
		this.i_reg = i_reg;
	}
	
}
