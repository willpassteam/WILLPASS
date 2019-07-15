package Board.DB;

import java.sql.Date;

public class BoardDTO {
	
	private int BOARD_NUM; // 고유숫자
	private String BOARD_TITLE;//제목
	private String BOARD_CONTENT;//내용
	private Date BOARD_DATE;//작성날짜
	private String BOARD_EMAIL;//작성자이메일
	private int BOARD_GROUP;//글의 위치
	
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String bOARD_TITLE) {
		BOARD_TITLE = bOARD_TITLE;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public String getBOARD_EMAIL() {
		return BOARD_EMAIL;
	}
	public void setBOARD_EMAIL(String bOARD_EMAIL) {
		BOARD_EMAIL = bOARD_EMAIL;
	}
	public int getBOARD_GROUP() {
		return BOARD_GROUP;
	}
	public void setBOARD_GROUP(int bOARD_GROUP) {
		BOARD_GROUP = bOARD_GROUP;
	}
	

	
	
	

}
