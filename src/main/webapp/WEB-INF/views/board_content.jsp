<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function() {
		
		$("#delbtn").on("click",function(){
			if($("#hidetr").css("display") === 'none'){
				$("#hidetr").css("display","block");
			}else{
				$("#hidetr").css("display","none");
			}
		});
		$("#hidep").on("keyup",function(){
			if($("#hidep").val() == ${Con.getBoard_pwd()}){
				$("#chkspan").html("<font color ='green'>비밀번호가 일치합니다.</font>");
				$("#chkbtn").on("click",function(){
					location.href="board_delete.do?num="+${Con.getBoard_no()};
				});
			}else{
				$("#chkspan").html("<font color ='red'>비밀번호가 일치하지 않습니다.</font>");
			}
		});
		$("#chkbtn")
		
		
		
	});
</script>

<style type="text/css">
	#ta{
		width: 600px;
	}
	#hidetr{
		display: none;
		
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div align="center">
		<hr width="50%" color="red">
			<h3>BOARD 테이블 게시글 ${Con.getBoard_writer()} 상세 페이지</h3>
		<hr width="50%" color="red">
		<br>	
		<table id="ta" border="1" cellspacing="0" width="500" class="table">
			<tr>
				<th>작성자</th>
				<td>${Con.getBoard_writer()}</td>
			</tr>
			<tr>
				<th>글 제목</th>
				<td>${Con.getBoard_title()}</td>
			</tr>
			<tr>
				<th>글 내용</th>
				<td>${Con.getBoard_cont()}</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
				<c:forEach begin="1" end="${Con.getBoard_pwd().length() }">
				*
				</c:forEach>
				</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${Con.getBoard_hit()}</td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${!empty Con.getBoard_update() }">
					 <th>수정일자</th>
					 <td>${Con.getBoard_update().substring(0,10) }</td>
					</c:when>
					<c:otherwise>
					 <th>등록일자</th>
					 <td>${Con.getBoard_date().substring(0,10)}</td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input  class="btn btn-outline-primary" type="button" value="글수정" onclick="location.href='board_update.do?num=${Con.getBoard_no()}&page=${Page}'">
					<input  class="btn btn-outline-primary" id="delbtn" type="button" value="글삭제">
					<input  class="btn btn-outline-primary" type="button" value="글목록" onclick="location.href='board_list.do'">
				</td>
			</tr>
		</table>
		<div align="center" id="hidetr">
							<p id="chkspan">비밀번호를 입력해 주세요.</p>
							<input id="hidep" type="password"><br>
							<input class="btn btn-outline-primary" id="chkbtn" type="button" value="글삭제" >
							
		</div>
	</div>

</body>
</html>