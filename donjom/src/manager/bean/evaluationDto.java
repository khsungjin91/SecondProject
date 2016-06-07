package manager.bean;

public class evaluationDto {
	private String e_memid,e_memname,e_document,e_result,e_content,e_cphave,e_cpfile;
	private int e_doccount,no;
	
	public String getE_content() {
		return e_content;
	}
	public void setE_content(String e_content) {
		this.e_content = e_content;
	}
	public String getE_cphave() {
		return e_cphave;
	}
	public void setE_cphave(String e_cphave) {
		this.e_cphave = e_cphave;
	}
	public String getE_cpfile() {
		return e_cpfile;
	}
	public void setE_cpfile(String e_cpfile) {
		this.e_cpfile = e_cpfile;
	}

	
	public String getE_memid() {return e_memid;	}
	public void setE_memid(String e_memid) {this.e_memid = e_memid;	}
	public String getE_memname() {return e_memname;	}
	public void setE_memname(String e_memname) {this.e_memname = e_memname;	}
	public String getE_document() {return e_document;	}
	public void setE_document(String e_document) {this.e_document = e_document;	}
	public String getE_result() {return e_result;	}
	public void setE_result(String e_result) {this.e_result = e_result;	}
	public int getE_doccount() {return e_doccount;	}
	public void setE_doccount(int e_doccount) {this.e_doccount = e_doccount;}
	public int getNo() {return no;}
	public void setNo(int no) {	this.no = no;}
	
	
}
