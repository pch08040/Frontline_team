package com.spring.frontline.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.frontline.dto.BoardDTO;
import com.spring.frontline.dto.CommentDTO;
import com.spring.frontline.dto.UserDTO;

@Repository
public class MainDAOImpl implements MainDAO{
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List selectUserList() {
		return sqlSession.selectList("user.selectUserList");
	}
	
	@Override
	public UserDTO selectUser(UserDTO userDTO) {
		return sqlSession.selectOne("user.selectUser", userDTO);
	}

	@Override
	public void insertUser(UserDTO userDTO) {
		sqlSession.insert("user.insertUser", userDTO);
	}

	@Override
	public UserDTO loginUser(Map map) {
		return sqlSession.selectOne("user.loginUser", map);
	}

	@Override
	public void updateUser(UserDTO userDTO) {
		sqlSession.update("user.updateUser", userDTO);
	}

	@Override
	public void deleteUser(List list) {
		sqlSession.delete("user.deleteUser", list);
	}

	@Override
	public int selectUserTotal(Map selectMap) {
		return sqlSession.selectOne("user.userTotal", selectMap);
	}

	@Override
	public List selectUserPage(Map selectMap) {
		
		List userList = sqlSession.selectList("user.userPage", selectMap);
		
		return userList;
	}

	@Override
	public void insertDummy(UserDTO userDTO) {
		sqlSession.insert("user.insertDummy", userDTO);
	}

	@Override
	public UserDTO findId(UserDTO userDTO) {
		return sqlSession.selectOne("user.findId", userDTO);
	}
	
	@Override
	public UserDTO findPw(UserDTO userDTO) {
		return sqlSession.selectOne("user.findPw", userDTO);
	}

	@Override
	public boolean checkId(Map map) {
		UserDTO userDTO = sqlSession.selectOne("user.checkId", map);
		
		if(userDTO == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean checkEmail(Map map) {
		UserDTO userDTO = sqlSession.selectOne("user.checkEmail", map);
		
		if(userDTO == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean checkPhone(Map map) {
		UserDTO userDTO = sqlSession.selectOne("user.checkPhone", map);
		
		if(userDTO == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List selectBoardList(Map map) {
		return sqlSession.selectList("board.selectBoardList", map);
	}
	
	@Override
	public List selectBoardPage(Map map) {
		List boardList = sqlSession.selectList("board.selectBoardPage", map);

		return boardList;
	}
	
	@Override
	public int selectBoardTotal(Map map) {
		int total = sqlSession.selectOne("board.selectBoardTotal", map);

		return total;
	}

	@Override
	public List selectRegionNames() {
		return sqlSession.selectList("board.selectRegionNames");
	}

	@Override
	public BoardDTO selectBoard(BoardDTO boardDTO) {
		return sqlSession.selectOne("board.selectBoard", boardDTO);
	}

	@Override
	public void addComment(CommentDTO commentDTO) {
		sqlSession.insert("comment.insertComment", commentDTO);
	}

	@Override
	public List selectCommentList(BoardDTO boardDTO) {
		return sqlSession.selectList("comment.selectCommentList", boardDTO);
	}

	@Override
	public List selectCommentPage(Map map) {
		List commentList = sqlSession.selectList("comment.commentPage", map);
		
		return commentList;
	}

	@Override
	public int selectCommentTotal(Map selectMap) {
		return sqlSession.selectOne("comment.commentTotal", selectMap);
	}

	@Override
	public CommentDTO selectComment(CommentDTO commentDTO) {
		return sqlSession.selectOne("comment.selectComment", commentDTO);
	}

	@Override
	public void updateComment(CommentDTO commentDTO) {
		sqlSession.update("comment.updateComment", commentDTO);
	}

	@Override
	public void deleteComment(List list) {
		sqlSession.delete("comment.deleteComment", list);
	}
	
	@Override
	public void insertBoard(BoardDTO boardDTO) {
		sqlSession.insert("board.insertBoard", boardDTO);
	}

	@Override
	public List selectAdminBoardPage(Map map) {
		List boardList = sqlSession.selectList("board.adminBoardPage", map);
		return boardList;
	}
	
	@Override
	public List selectAdminBoardSearchPage(Map map) {
		List boardList = sqlSession.selectList("board.adminBoardSearchPage", map);
		return boardList;
	}

	@Override
	public int selectAdminBoardTotal(Map map) {
		return sqlSession.selectOne("board.boardTotal", map);
	}
	
	@Override
	public int selectAdminBoardSearchTotal(Map map) {
		return sqlSession.selectOne("board.boardSearchTotal", map);
	}

	@Override
	public void deleteBoard(List list) {
		sqlSession.delete("board.deleteBoard", list);
	}

	@Override
	public BoardDTO getAdminBoard(BoardDTO boardDTO) {
		return sqlSession.selectOne("board.selectBoard", boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) {
		sqlSession.update("board.updateBoard", boardDTO);
	}

	@Override
	public List getBoardInfoList() {
		return sqlSession.selectList("board.selectEatBoard");
	}
	
	@Override
	public void deleteBoardDTO(List list) {
		 sqlSession.delete("board.deleteDetailBoard", list);
	}
	
	@Override
	public BoardDTO detailBoardDTO(BoardDTO dto) {
		return sqlSession.selectOne("board.selectDetailBoard", dto);
	}
	
	@Override
	public void updateBoardDTO(BoardDTO dto) {
		 sqlSession.update("board.updateDetailBoard", dto);
	}
	
	@Override
	public void travelNew(BoardDTO dto) {
		sqlSession.insert("board.travelNew", dto);
		
	}

	@Override
	public List travelList() {
		return sqlSession.selectList("board.travelList");
	}
	
	@Override
	public BoardDTO travelUpdate(BoardDTO dto) {
		return sqlSession.selectOne("board.travelUpdate", dto);
	}
	
	@Override
	public void setBoard(BoardDTO dto) {
		sqlSession.update("board.setBoard", dto);
		
	}
	
	@Override
	public void travelDelete(String[] boardDelete) {
		sqlSession.delete("board.travelDelete", boardDelete);
	}
	
	@Override
	public List boardPick1(BoardDTO dto) {
		return sqlSession.selectList("board.boardPick1",dto);
	}

	@Override
	public List boardPick2(BoardDTO dto) {
		return sqlSession.selectList("board.boardPick2",dto);
	}

	@Override
	public List boardPick3(BoardDTO dto) {
		return sqlSession.selectList("board.boardPick3",dto);
	}

	@Override
	public List boardPick4(BoardDTO dto) {
		return sqlSession.selectList("board.boardPick4",dto);
	}

	@Override
	public List pageBoard(BoardDTO boardDTO) {
		
	    List pageBoard = sqlSession.selectList("board.pageBoard", boardDTO);
	    
		return pageBoard;
	}
	
	@Override
	public int pageTotal() {
		
		int total = sqlSession.selectOne("board.pageTotal");
		return total;
	}
	
	@Override
	public BoardDTO updatePage(BoardDTO boardDTO) {

		return sqlSession.selectOne("board.updatePage", boardDTO);
	}
	
	@Override
	public int deleteBoard(String delete) {					
		int deleteBoard = sqlSession.delete("board.deleteRoomBoard", delete);
		
		return deleteBoard;
		
	}
	
	@Override
	public List popup1() {
		List popupList = sqlSession.selectList("user.popup1");
		return popupList;
	}
	
	@Override
	public Map popupReadyUpdate(Map map) {
		Map popupSetReady = sqlSession.selectOne("user.popupReadyUpdate", map);
		
		return popupSetReady;
	}
	
	@Override
	public void popupUpdate(Map map) {
		int popupUpdate = sqlSession.update("user.popupUpdate", map);
	}
}
