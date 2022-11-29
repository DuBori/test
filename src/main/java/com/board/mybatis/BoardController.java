package com.board.mybatis;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.BoardDAO;
import com.board.model.BoardDTO;
import com.board.model.PageDTO;

@Controller
public class BoardController {

	@Inject
	private BoardDAO dao;
	
	private final int rowsize = 3;
	private int totalRecord = 0;
	
	@RequestMapping("/board_list.do")
	public String list(Model model, HttpServletRequest request) {
		
		// 페이징 처리 작업
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}else {
			page=1;
		}
		
        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.getListCount();

        PageDTO dto = new PageDTO(page, rowsize, totalRecord);

        // 페이지에 해당하는 게시물을 가져오는 메서드 호출.
        List<BoardDTO> list = this.dao.getBoardList(dto);

        model.addAttribute("List", list);

        model.addAttribute("Paging", dto);

        return "board_list";

    }
	
	@RequestMapping("/board_insert.do")
	public String insert() {
		
		return "board_insert";
	}
	
	@RequestMapping("/board_insert_ok.do")
	public void insertOk(BoardDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(this.dao.insertBoard(dto)>0) {
			out.println("<script>");
			out.println("alert('게시글 등록 완료')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 등록 실패')");
			out.println("history.back()");
			out.println("</script>");		
		}
		
	}
	
	@RequestMapping("/board_content.do")
	public String content(@RequestParam("num") int num,@RequestParam("page") int page, Model model)
	{
		dao.readCount(num);
		model.addAttribute("Con",dao.boardCont(num));
		model.addAttribute("Page",page);
		return "board_content";
	}
	
	@RequestMapping("/board_update.do")
	public String update(@RequestParam("num") int num,@RequestParam("page") int page, Model model)
	{
		System.out.println("들어옴");
		model.addAttribute("Con",dao.boardCont(num));
		model.addAttribute("Page",page);
		
		return "board_update";
	}
	@RequestMapping("/board_update_ok.do")
	public void updateOk(@RequestParam("db_pwd") String pwd,@RequestParam("page") int page,BoardDTO dto,HttpServletResponse response) throws IOException
	{
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(dto.getBoard_pwd().equals(pwd)) {
			if(this.dao.updateBoard(dto)>0) {
				out.println("<script>");
				out.println("alert('게시글 수정 완료')");
				out.println("location.href='board_content.do?num="+dto.getBoard_no()+"&page="+page+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('게시글 수정 실패')");
				out.println("history.back()");
				out.println("</script>");		
			}
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");	
		}
	}
	@RequestMapping("/board_delete.do")
	public void delete(@RequestParam("num") int num,HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(dao.deleteBoard(num)>0) {
			dao.updateSeq(num);
			out.println("<script>");
			out.println("alert('게시글 삭제 완료')");
			out.println("location.href='board_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시글 삭제 실패')");
			out.println("history.back()");
			out.println("</script>");	
		}
		
		
	}
	
	@RequestMapping("/board_search.do")
	public String search( Model model, HttpServletRequest request) {
	
		int page;
		String field, keyword;
		if(request.getParameter("page") != null) {
			page=Integer.parseInt(request.getParameter("page"));
		}else {
			page=1;
		}
		
		if(request.getParameter("field") == null) {
			field = "board_no";
		}else {
			field= request.getParameter("field");
		}
		
		
		if(request.getParameter("keyword")== null) {
			keyword = "";
		}else {
			keyword=request.getParameter("keyword");
		}
				
        // DB상의 전체 게시물의 수를 확인하는 메서드 호출.
        totalRecord = this.dao.searchBoardCount(field, keyword);
		        
		model.addAttribute("List", this.dao.searchBoardList(new PageDTO(page, rowsize, totalRecord, field, keyword)));
		model.addAttribute("Paging", new PageDTO(page, rowsize, totalRecord, field, keyword));
		model.addAttribute("Chk", "hi");
		return "board_list";
	}
	
}
