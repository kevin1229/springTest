<%@page import="java.util.List" %>
<%@page import="com.springbook.biz.board.impl.BoardDAO" %>
<%@page import="com.springbook.biz.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<BoardVO> boardList = (List) session.getAttribute("boardList");
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Board List</title>
</head>

<body>
	<center>
		<h1>Board List</h1>
		<h3>Mr. Test Welcome... <a href="logout.do">Log-out</a></h3>
		
		<form action="getBoardList.jsp" method="post">
			<table border="1" cellpadding="0" cellspacing="0" width="700">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<option value="TITLE">Title </option>
							<option value="CONTENT">Content</option>
						</select>
						<input name="searchKeyword" type="text" />
						<input type="submit" value="Search"/>
					</td>
				</tr>
			</table>
		</form>
		
		<table border="1" cellpadding="0" cellspacing="0" width="700">
			<tr>
				<th bgcolor="orange" width="100">Number</th>
				<th bgcolor="orange" width="200">Title</th>
				<th bgcolor="orange" width="150">Writer</th>
				<th bgcolor="orange" width="150">RegDate</th>
				<th bgcolor="orange" width="100">ViewCount</th>
			</tr>
			
			<% for(BoardVO board : boardList) { %>
			<tr>
				<td><%= board.getSeq() %></td>
				<td align="left"><a href="getBoard.do?seq=<%= board.getSeq() %>">
								<%= board.getTitle() %></a></td>
				<td><%= board.getWriter() %></td>	
				<td><%= board.getRegDate() %></td>
				<td><%= board.getCnt() %></td>		
			</tr>
			<%}%>
		</table>
		<br>
			<a href="insertBoard.jsp">New Board Registry</a>
	</center>
</body>
</html>