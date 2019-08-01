package Board.DB;

import java.sql.Date;

public class BoardDTO {
	
	private int BOARD_NUM; // 고유숫자
	private String BOARD_TITLE;//제목
	private String BOARD_CONTENT;//내용
	private Date BOARD_DATE;//작성날짜
	private String BOARD_ID;//작성자이메일
	private int BOARD_POS;//글의 위치
	private int BOARD_DEPTH;//글의 위치
	
	
	
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
	public String getBOARD_ID() {
		return BOARD_ID;
	}
	public void setBOARD_ID(String bOARD_ID) {
		BOARD_ID = bOARD_ID;
	}
	public int getBOARD_POS() {
		return BOARD_POS;
	}
	public void setBOARD_POS(int bOARD_POS) {
		BOARD_POS = bOARD_POS;
	}
	public int getBOARD_DEPTH() {
		return BOARD_DEPTH;
	}
	public void setBOARD_DEPTH(int bOARD_DEPTH) {
		BOARD_DEPTH = bOARD_DEPTH;
	}
	
	
	
	

}
