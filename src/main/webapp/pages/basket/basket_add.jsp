<%@page import="dao.BasketDAO"%>
<%@page import="dto.BasketDTO"%>
<%@page import="date.DateManager"%>
<%@page import="dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="basket" class="dto.BasketDTO" ></jsp:useBean>
<%
	//로그인되어있는지?
	UserDTO userdto = (UserDTO) session.getAttribute("userInfo");		
	String pid_str = request.getParameter("pid");
	if(!(userdto!=null && pid_str!=null))
		
	{
		out.println("<script>");
		out.println("alert('장바구니에 등록하려면 로그인해주세요!')");
		out.println("location.href='./../login/loginForm.html'");
		out.println("</script>");
		return;

	}//로그인상태+pid가 널이 아닐 경우!
	else{
	int pid = Integer.parseInt(pid_str);
	//db 장바구니에 추가
	basket.setDate(DateManager.getDate());
	basket.setPid(pid);//전페이지에서 넘겨온 pid;
	basket.setUid(userdto.getUid());
	basket.setUserName(userdto.getUserName());
	//세션에서 추가
	boolean isDone = BasketDAO.getInstance().insertDB(basket);
	if(isDone){
		out.println("<script>");
		out.println("alert('장바구니에 동록되었습니다!')");
		out.println("location.href='./../main/main.jsp'");
		out.println("</script>");
	}
	else{
		out.println("<script>");
		out.println("alert('해당 그림은 이미 장바구니에 추가되어있습니다!')");
		out.println("location.href='./../basket/basket_show.jsp'");
		out.println("</script>");
	}
	
	}

%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>