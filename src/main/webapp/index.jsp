<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.DBCon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<center>
	<!-- DB 연결 및 데이터 INSERT 확인 -->
	<%
	out.println("<h1>[index.jsp] DB 점검을 시작합니다.</h1>");
	out.println("<hr>");
	// DB 연결 설정 오류!

	out.println("★DB 연결 : ");
	boolean isError = !DBCon.getInstance().initConnection();
	System.out.print(isError);
	//DB 연결실패
	if (isError) {
		// 실패 알림 띄우기
		out.println("실패<br>");
		out.println("<script>");
		out.println("alert('[데이터베이스 연결오류] : DBCon클래스에서 DB 설정을 해주세요!')");
		out.println("setTimeout(function() {");
		out.println("alert('sql 문서를 다운로드합니다.');");
		out.println("location.href='./create_table2.sql';}, 1000);"); 
		out.println("</script>");
		
		return;
	}
	// DB 설정 성공!
	else {
		out.println("성공<br>");
		DBCon.getInstance().dispose(); // db 연결 해제 

	}
	%>

	<%
	//DB Production 테이블 확인
	ArrayList<ProductDTO> arrayList = ProductDAO.getInstance().getDBList();

	out.println("★Product 테이블 점검 : ");
	if (arrayList != null)//첫 값 확인
	{
		// 성공 알림 띄우기
		out.println("성공<br>");

		out.println("<script>");
		out.println("setTimeout(function() {");
		out.println("alert('초기화 성공! 메인페이지로 이동합니다!!!');");

		out.println("location.href='./pages/main/main.jsp';}, 3000);"); 
		out.println("</script>");

	}
	//arrayList가 null 초기화가 안되있음. or 데이터가 없음.
	else {
		//오류 구문 출력

		out.println("실패<br>");
		out.println("<script>");
		out.println("alert('[데이터베이스 Product 테이블 오류] : Product 테이블이 비어있거나, 테이블이 생성되지 않았습니다!')");
		
		out.println("setTimeout(function() {");
		out.println("alert('sql 문서를 다운로드합니다.');");
		out.println("location.href='./create_table2.sql';}, 1000);"); 
		out.println("</script>");
		return;

	}

	out.println("<hr>");
	%>



</center>


<!DOCTYPE html>
<html>
</html>