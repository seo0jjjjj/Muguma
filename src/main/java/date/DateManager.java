package date;

import java.text.SimpleDateFormat;
import java.util.Date;

///현재 날짜를 불러오는 함수를 가지는 static 클래스 (게시판에서 DATE를 입력하기 용도)
public class DateManager {
	private String date;
	public DateManager() {}
	public static String getDate() {
		String pattern = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);

		String date = simpleDateFormat.format(new Date());
		return date;
	}

	
}
