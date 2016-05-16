package point.bean;

import java.sql.Timestamp;

public class PointDto {
	
	
	private int no,ch_price,re_price;
	private long total_ch,total_re;
	private Timestamp ch_charday,re_reday;
	private String ch_name;
	
	
	

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
	public void setTotal_re(int total_re) {
		this.total_re = total_re;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCh_price() {
		return ch_price;
	}
	public void setCh_price(int ch_price) {
		this.ch_price = ch_price;
	}
	public int getRe_price() {
		return re_price;
	}
	public void setRe_price(int re_price) {
		this.re_price = re_price;
	}
	public Timestamp getCh_charday() {
		return ch_charday;
	}
	public void setCh_charday(Timestamp ch_charday) {
		this.ch_charday = ch_charday;
	}
	public Timestamp getRe_reday() {
		return re_reday;
	}
	public void setRe_reday(Timestamp re_reday) {
		this.re_reday = re_reday;
	}
	public String getCh_name() {
		return ch_name;
	}
	public void setCh_name(String ch_name) {
		this.ch_name = ch_name;
	}
	
}
