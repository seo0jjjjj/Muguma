<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!--css���� --><link href="write_style.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
<div class="don"><h1>Mugema</h1></div>
	<!-- �۾��� ��� �������� ��-->
	<div class="Container">
		<div class="row">
			<form action="write.jsp" method="post">
				<table style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�Խ��� �۾���</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td><input type="text" class=" " placeholder="�� ����" name="borderTitle" maxlength="50"> 
						</td>
						</tr>
						<tr>
						<td><textarea placeholder="�� ����" name="Content" maxlength="1024" style="height:350px; width: 600px"></textarea>
						</td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="�۾���">
			</form>
		</div>
	</div>
</body>
</html>