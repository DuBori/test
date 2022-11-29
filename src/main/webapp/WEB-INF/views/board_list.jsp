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
<style type="text/css">
	#ta{
		width: 600px;
	}
</style>
<meta charset="UTF-8">

<title></title>
</head>
<body>
	<div align="center">
		<hr width="50%" color="red">
			<h3>BOARD 테이블 게시글 전체 리스트 페이지</h3>
		<hr width="50%" color="red">
		<br>
		
		<table id="ta" border="1" cellspacing="0" width="500" class="table">
			
			<tr>
				<th>게시글 No.</th>
				<th>글 제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일자</th>
			</tr> 
			<c:choose>
				<c:when test="${!empty List }">
					<c:forEach items="${List }" var="dto">
						<tr>
							<td>${dto.getBoard_no() }</td>
							<td><a href="<%=request.getContextPath()%>/board_content.do?num=${dto.getBoard_no()}&page=${Paging.getPage()}">${dto.getBoard_title() }</a></td>
							<td>${dto.getBoard_writer() }</td>
							<td>${dto.getBoard_hit() }</td>
							<td>${dto.getBoard_date() }</td>
						</tr>
					
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" align="center">게시글 내용 없음</td>
					</tr>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="5" align="center">
					<input class="btn btn-outline-primary" type="button" value="글쓰기" onclick="location.href='board_insert.do'">
				</td> 
			</tr>
		</table>
		<br>
		<form action="<%=request.getContextPath()%>/board_search.do">
			
			<div align="center">
				<select name="field">
					<option selected="selected" value="board_no">게시글 번호</option>
					<option value="board_title">글제목</option>
					<option value="board_writer">작성자</option>
				</select>
				<input name="keyword" >
				<input class="btn btn-outline-primary" type="submit" value="검색">
				
			</div>
		</form>
		<br>
		
<!-- 페이징처리부분 -->
      <c:choose>
      	<c:when test="${!empty Chk }">
      		<c:set value="board_search.do" var="k"></c:set>
      	</c:when>
      	<c:otherwise>
      		<c:set value="board_list.do" var="k"></c:set>
      	</c:otherwise>
      </c:choose>
      <c:if test="${Paging.getPage() > Paging.getBlock() }">
         <a href="${k}?page=1">[처음으로]</a>
         <a href="${k}?page=${Paging.getStartBlock()-1}">◀</a>
      </c:if>
      
      <c:forEach begin="${Paging.getStartBlock()}" end="${Paging.getEndBlock() }" var="i">
         <c:if test="${i == Paging.getPage() }">
            <b><a href="${k}?page=${i}">[${i}]</a></b>
         </c:if>
         <c:if test="${i != Paging.getPage() }">
            <a href="${k}?page=${i}">[${i}]</a>
         </c:if>
      </c:forEach>
      
      <c:if test="${Paging.getEndBlock() < Paging.getAllPage() }">
         <a href="${k}?page=${Paging.getEndBlock()+1}">▶<a>
         <a href="${k}?page=${Paging.getAllPage() }">[마지막으로]</a>
      </c:if>
	
	</div>

</body>
</html>