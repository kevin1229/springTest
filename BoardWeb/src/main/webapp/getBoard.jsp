<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
					  "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Detail Board</title>
</head>

<body>
	<center>
		<h1> Detail Board </h1>
		<a href="logout.do">Log-out</a>
		<hr>
			<form action="updateBoard.do" method="post">
				<input name="seq" type="hidden" value="${board.seq }" />
				<table border="1" cellpadding="0" cellspacing="0">
					<tr>
						<td bgcolor="orange" width="70">Title</td>
						<td align="left"><input name="title" type="text" value="${board.title }"/></td>
					</tr>
					<tr>
						<td bgcolor="orange">Writer</td>
						<td align="left">${board.title }</td>
					</tr>
					<tr>
						<td bgcolor="orange">Contents</td>
						<td align="left">
							<textarea name="content" cols="40" rows="10">${board.content }</textarea>
						</td>
					</tr>
					<tr>
						<td bgcolor="orange">Reg Date</td>
						<td align="left">
							${board.regDate }
						</td>
					</tr>
					<tr>
						<td bgcolor="orange">Views</td>
						<td align="left">
							${board.cnt }
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="Modify Article" />
						</td>
					</tr>
				</table>				
			</form>
		</hr>
		<a href="insertBoard.jsp">Registry Board</a>&nbsp;&nbsp;&nbsp;
		<a href="deleteBoard.do?seq=${board.seq }">Delete Board</a>&nbsp;&nbsp;&nbsp;
		<a href="getBoardList.do">Board List</a>
	</center>
</body>
</html>