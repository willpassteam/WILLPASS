
package net.reservationcheck.action;

//게시판 페이징용

public class Paging {

	
	private int page;//현재페이지
	private int range; //현재페이지 범위
	private int listcnt; //전체개시물의개수
	private int pagecnt;//총 페이지범위의 개수 
	private int listsize=10; //한페이지당 보여질 list의 개수 
	private int rangesize=3; //한페이지당 보여질 페이지의 개수 
	private int startpage; //각페이지 범위 시작번호 
	private int startlist; // 게시판시작번호 
	private int endpage; //각페이지 범위 끝 번호 
	private boolean prev; //이전페이지 여부 
	private boolean next;  //다음페이지 여부 
	
	
	public Paging() {
		// TODO Auto-generated constructor stub
	}


	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getRange() {
		return range;
	}


	public void setRange(int range) {
		this.range = range;
	}


	public int getListcnt() {
		return listcnt;
	}


	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}


	public int getPagecnt() {
		return pagecnt;
	}


	public void setPagecnt(int pagecnt) {
		this.pagecnt = pagecnt;
	}


	public int  getListsize() {
		return listsize;
	}


	public void setListsize(int listsize) {
		this.listsize = listsize;
	}


	public int getRangesize() {
		return rangesize;
	}


	public void setRangesize(int rangesize) {
		this.rangesize = rangesize;
	}


	public int getStartpage() {
		return startpage;
	}


	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}


	public int getStartlist() {
		return startlist;
	}


	public void setStartlist(int startlist) {
		this.startlist = startlist;
	}


	public int getEndpage() {
		return endpage;
	}


	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}


	public boolean getPrev() {
		return prev;
	}


	public void setPrev(boolean prev) {
		this.prev = prev;
	}


	public boolean getNext() {
		return next;
	}


	public void setNext(boolean next) {
		this.next = next;
	}
	
	public void pageInfo(int page, int range, int listcnt) {

		this.page = page;

		this.range = range;

		this.listcnt=listcnt;
		//전체 페이지수 
		this.pagecnt = (int) Math.ceil((double)listcnt/listsize);

		//시작 페이지

		this.startpage = (range - 1) * rangesize + 1 ;

		//끝 페이지

		this.endpage = range * rangesize;

		//게시판 시작번호

		this.startlist = (page - 1) * listsize;

		//이전 버튼 상태

		this.prev = range == 1 ? false : true;

		

		//다음 버튼 상태

		this.next = endpage > pagecnt ? false : true;

		if (this.endpage > this.pagecnt) {

			this.endpage = this.pagecnt;

			this.next = false;


	}


	
	
	
}}
