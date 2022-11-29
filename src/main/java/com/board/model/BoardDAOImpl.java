package com.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return 	sqlSession.selectOne("count");
	}

	@Override
	public List<BoardDTO> getBoardList(PageDTO dto) {
		return this.sqlSession.selectList("list",dto);
	}

	@Override
	public int insertBoard(BoardDTO dto) {
		
		return this.sqlSession.insert("insert", dto);
	}

	@Override
	public void readCount(int no) {
		this.sqlSession.update("read", no);
	}

	@Override
	public BoardDTO boardCont(int no) {
		return this.sqlSession.selectOne("con", no);
	}

	@Override
	public int updateBoard(BoardDTO dto) {
		
		return this.sqlSession.update("update", dto);
	}

	@Override
	public int deleteBoard(int no) {
		return this.sqlSession.delete("delete", no);
	}

	@Override
	public void updateSeq(int no) {
		this.sqlSession.update("seq",no);
	}
	
	@Override
	public int searchBoardCount(String field, String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field",field);
		map.put("keyword", keyword);
		return this.sqlSession.selectOne("searchcount", map);
	}

	@Override
	public List<BoardDTO> searchBoardList(PageDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("field",dto.getField());
		map.put("keyword", dto.getKeyword());
		map.put("dto",dto);
		return this.sqlSession.selectList("search", map);
	}

}
