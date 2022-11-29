<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style type="text/css">
	#ta{
		width: 600px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="gray">
			<h3>BOARD 테이블 게시판 글쓰기 폼 페이지</h3>
		<hr width="50%" color="gray">
		<br>
		
		<form action="<%=request.getContextPath()%>/board_insert_ok.do" method="post">
			
			<table id="ta" border="1" cellspacing="0" class="table">
				<tr>
					<th>작성자</th>
					<td><input name="board_writer"></td>
				</tr>
				<tr>
					<th>글제목</th>
					<td><input name="board_title"></td>
				</tr>
				<tr>
					<th>글내용</th>
					<td><textarea rows="7" cols="25" name="board_cont"></textarea></td>
				</tr>
				<tr>
					<th>글 비밀번호</th>
					<td><input type="password" name="board_pwd"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input class="btn btn-outline-primary"  type="submit" value="글쓰기">
						<input class="btn btn-outline-primary"  type="reset" value="다시작성">
						<input class="btn btn-outline-primary"  type="button" value="게시글 목록" onclick="location.href='board_list.do'">
					</td>
				</tr>
			</table>
		
			
		
		
		</form>
	
	</div>
	
</body>
</html>