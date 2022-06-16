package mail;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import org.apache.commons.codec.binary.Hex;

/// 난수를 생성하는 클래스
public class HashCreater {
	/// MessageDigest 인스턴스 생성 및 SHA-512를 이용해 헤시코드 생성함수
	
	public static String createHash(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		String result;
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-512");
		// 해쉬 값 업데이트
		messageDigest.update(str.getBytes("utf-8"));
		result = Hex.encodeHexString(messageDigest.digest());

		return result;
	}

	/// 알파벳으로 된 랜덤 문자열을 생성하는 함수. (현 프로젝트에서 사용 x)
	public static String createRandomString() {
		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 10;
		Random random = new Random();

		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		return generatedString;
	
	}

}