package setting.bean;

public class pagingAction {

	private int currentPage;   // ����������
	private int totalCount;	 // ��ü �Խù� ��
	private int totalPage;	 // ��ü ������ ��
	private int blockCount;	 // �� ��������  �Խù��� ��
	private int blockPage;	 // �� ȭ�鿡 ������ ������ ��
	private int startCount;	 // �� ���������� ������ �Խñ��� ���� ��ȣ
	private int endCount;	 // �� ���������� ������ �Խñ��� �� ��ȣ
	private int startPage;	 // ���� ������
	private int endPage;	 // ������ ������
	private int paging;      // Ŀ��Ʈ������ ���

	private StringBuffer pagingHtml;

	// ����¡ ������
	public pagingAction(int currentPage, int totalCount, int blockCount,
			int blockPage, int paging) {
	
		this.blockCount = blockCount;
		this.blockPage = blockPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.paging = paging;

		// ��ü ������ ��
		totalPage = (int) Math.ceil((double) totalCount / blockCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		// ���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		// ���� �������� ó���� ������ ���� ��ȣ ��������.
		
		startCount = (currentPage - 1) * blockCount;
		endCount = startCount + blockCount - 1;

		// ���� �������� ������ ������ �� ���ϱ�.
		startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
		endPage = startPage + blockPage - 1;

		// ������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// ���� block ������
		pagingHtml = new StringBuffer();
		//item�� ������ �ȵ������� ����

		if (currentPage > blockPage) {
			if(paging == 0){
				pagingHtml.append("<a href=setting_session_history.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 1){
				pagingHtml.append("<a href=notification.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 2){
				pagingHtml.append("<a href=manager_member.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 3){
				pagingHtml.append("<a href=manager_noconfirm.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 4){
				pagingHtml.append("<a href=manager_evaluation.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 5){
				pagingHtml.append("<a href=manager_borrowmn.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 6){
				pagingHtml.append("<a href=manager_remittance.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 7){
				pagingHtml.append("<a href=manager_remittanced.dj?currentPage="
						+ (startPage - 1) +">");
			}else if(paging == 8){
				pagingHtml.append("<a href=fundList.dj?currentPage="
						+ (startPage - 1) +">");
			}
			
			pagingHtml.append("����");
			pagingHtml.append("</a>");
		}

		pagingHtml.append("&nbsp;[&nbsp;");

		//������ ��ȣ.���� �������� ���������� �����ϰ� ��ũ�� ����.
	
		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("&nbsp;<b> <font color='orange' size='5'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			} else {
				if(paging == 0){
					pagingHtml.append("&nbsp;<a href='setting_session_history.dj?currentPage=");
				}else if(paging == 1){
					pagingHtml.append("&nbsp;<a href='notification.dj?currentPage=");
				}else if(paging == 2){
					pagingHtml.append("&nbsp;<a href='manager_member.dj?currentPage=");
				}else if(paging == 3){
					pagingHtml.append("&nbsp;<a href='manager_noconfirm.dj?currentPage=");
				}else if(paging == 4){
					pagingHtml.append("&nbsp;<a href='manager_evaluation.dj?currentPage=");
				}else if(paging == 5){
					pagingHtml.append("&nbsp;<a href='manager_borrowmn.dj?currentPage=");
				}else if(paging == 6){
					pagingHtml.append("&nbsp;<a href='manager_remittance.dj?currentPage=");
				}else if(paging == 8){
					pagingHtml.append("&nbsp;<a href='fundList.dj?currentPage=");
				}else if(paging == 7){
					pagingHtml.append("&nbsp;<a onclick='paging(");
					pagingHtml.append(i);
					pagingHtml.append(")' href='#currentPage=");
				}				
				pagingHtml.append(i);
				pagingHtml.append("'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}

			pagingHtml.append("&nbsp;");
		}

		pagingHtml.append("&nbsp;&nbsp;]&nbsp;&nbsp;");

		// ���� block ������
		if (totalPage - startPage >= blockPage) {
			if(paging == 0){
			pagingHtml.append("<a href=setting_session_history.dj?currentPage="
					+ (endPage + 1) + ">");
			}else if(paging == 1){
			pagingHtml.append("<a href=notification.dj?currentPage="
					+ (endPage + 1) + ">");	
			}else if(paging == 2){
				pagingHtml.append("<a href='manager_member.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 3){
				pagingHtml.append("<a href='manager_noconfirm.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 4){
				pagingHtml.append("<a href='manager_evaluation.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 5){
				pagingHtml.append("<a href='manager_borrowmn.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 6){
				pagingHtml.append("<a href='manager_remittance.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 7){
				pagingHtml.append("<a href='manager_remittanced.dj?currentPage="
						+ (endPage + 1) + ">");
			}else if(paging == 8){
				pagingHtml.append("<a href='fundList.dj?currentPage="
						+ (endPage + 1) + ">");
			}			
			pagingHtml.append("����");
			pagingHtml.append("</a>");
			}
		
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBlockCount() {
		return blockCount;
	}

	public void setBlockCount(int blockCount) {
		this.blockCount = blockCount;
	}

	public int getBlockPage() {
		return blockPage;
	}

	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}

	public int getStartCount() {
		return startCount;
	}

	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}

	public int getEndCount() {
		return endCount;
	}

	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public void setPagingHtml(StringBuffer pagingHtml) {
		this.pagingHtml = pagingHtml;
	}
}
