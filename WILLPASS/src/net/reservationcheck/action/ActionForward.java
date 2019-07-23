package net.reservationcheck.action;

public class ActionForward {
	//페이지 이동 방식 여부값을 저장할 변수
	private boolean isRedirect = false;	//true또는 false가 저장됨
	
	//이동할 뷰페이지 경로 주소값을 저장할 변수
	private String path = null;
	
	//이동할 뷰페이지 경로 주소값을 변수에 저장할 메소드
	public void setPath(String path){
		this.path=path;
	}
	
	//이동할 페이지 경로 주소값을 반환할 메소드
	public String getPath(){
		return path;
	}
	
	//페이지 이동 방식 여부값을 저장할 메소드
	public void setRedirect(boolean isRedirect){
		this.isRedirect = isRedirect;
	}
	
	//페이지 이동방식 여부값을 반환(리턴) 하는 메소드
	public boolean isRedirect(){
		return isRedirect;
	}
}
