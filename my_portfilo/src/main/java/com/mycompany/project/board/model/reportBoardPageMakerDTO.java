package com.mycompany.project.board.model;

public class reportBoardPageMakerDTO {

	/* ?‹œ?‘ ?˜?´ì§? */
    private int startPage;
    
    /* ? ?˜?´ì§? */
    private int endPage;
    
    /* ?´? „ ?˜?´ì§?, ?‹¤?Œ ?˜?´ì§? ì¡´ì¬?œ ë¬? */
    private boolean prev, next;
    
    /*? „ì²? ê²Œì‹œë¬? ?ˆ˜*/
    private int total;
    
    /* ?˜„?¬ ?˜?´ì§?, ?˜?´ì§??‹¹ ê²Œì‹œë¬? ?‘œ?‹œ?ˆ˜ ? •ë³? */
    private reportBoardCriteria cri;

    public reportBoardPageMakerDTO(reportBoardCriteria cri, int total) {
        
        this.cri = cri;
        this.total = total;
        
        /* ë§ˆì?ë§? ?˜?´ì§? */
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
        /* ?‹œ?‘ ?˜?´ì§? */
        this.startPage = this.endPage - 9;
        
        /* ? „ì²? ë§ˆì?ë§? ?˜?´ì§? */
        int realEnd = (int)(Math.ceil(total * 1.0/cri.getAmount()));
        
        if(realEnd < this.endPage) {
            this.endPage = realEnd;
        }
        
        /* ?‹œ?‘ ?˜?´ì§?(startPage)ê°’ì´ 1ë³´ë‹¤ ?° ê²½ìš° true */
        this.prev = this.startPage > 1;
        
        /* ë§ˆì?ë§? ?˜?´ì§?(endPage)ê°’ì´ 1ë³´ë‹¤ ?° ê²½ìš° true */
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
