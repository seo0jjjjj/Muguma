package date;

import java.text.SimpleDateFormat;
import java.util.Date;

//현재 날짜를 db에 맞는 형식으로 불러옴.
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
