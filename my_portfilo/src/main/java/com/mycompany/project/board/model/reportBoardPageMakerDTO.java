package com.mycompany.project.board.model;

public class reportBoardPageMakerDTO {

	/* ?��?�� ?��?���? */
    private int startPage;
    
    /* ?�� ?��?���? */
    private int endPage;
    
    /* ?��?�� ?��?���?, ?��?�� ?��?���? 존재?���? */
    private boolean prev, next;
    
    /*?���? 게시�? ?��*/
    private int total;
    
    /* ?��?�� ?��?���?, ?��?���??�� 게시�? ?��?��?�� ?���? */
    private reportBoardCriteria cri;

    public reportBoardPageMakerDTO(reportBoardCriteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        /* 마�?�? ?��?���? */
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        /* ?��?�� ?��?���? */
        this.startPage = this.endPage - 9;
        
        /* ?���? 마�?�? ?��?���? */
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        /* ?��?�� ?��?���?(startPage)값이 1보다 ?�� 경우 true */
        this.prev = this.startPage > 1;
        
        /* 마�?�? ?��?���?(endPage)값이 1보다 ?�� 경우 true */
        this.next = this.endPage < realEnd;
        
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public reportBoardCriteria getCri() {
		return cri;
	}

	public void setCri(reportBoardCriteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMakerDTO [startPage=" + startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next
				+ ", total=" + total + ", cri=" + cri + "]";
	}
	
	
	
}
