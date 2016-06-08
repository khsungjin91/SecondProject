package manager.bean;

import java.io.File;
import java.util.Date;

public class ManagerNewsDto {
	private int num;
	
	private String image;
	private String sitename;
	private String title;
	private String content;
	private String site;
	private Date reg;

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setReg(Date reg) {
		this.reg = reg;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSitename() {
		return sitename;
	}
	public void setSitename(String sitename) {
		this.sitename = sitename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public Date getReg() {
		return reg;
	}
	public void setRegdate(Date reg) {
		this.reg = reg;
	}
	
}
