package com.spring.frontline.service;

import java.util.List;
import java.util.Map;

import com.spring.frontline.dto.BoardDTO;
import com.spring.frontline.dto.CommentDTO;
import com.spring.frontline.dto.UserDTO;

public interface MainService {
	UserDTO getUser(UserDTO userDTO);
	List getUserList();
	void insertUser(UserDTO userDTO);
	UserDTO doLogin(Map map);
	void updateUser(UserDTO userDTO);
	void deleteUser(List list);
	Map getUserPage(Map map);
	void insertDummy(int loop);
	UserDTO findId(UserDTO userDTO);
	UserDTO findPw(UserDTO userDTO);
	boolean checkJoin(Map map);
	Map getBoardList(String regionSeq);
	Map getBoardPage(Map map);
	List getRegionNames();
	BoardDTO getBoard(BoardDTO boardDTO);
	void addComment(CommentDTO commentDTO);
	List getCommentList(BoardDTO boardDTO);
	Map getCommentPage(Map map);
	CommentDTO getComment(CommentDTO commentDTO);
	void updateComment(CommentDTO commentDTO);
	void deleteComment(List list);
	void insertBoard(BoardDTO boardDTO);
	Map getAdminBoardPage(Map map);
	void deleteBoard(List list);
	BoardDTO getAdminBoard(BoardDTO boardDTO);
	void updateBoard(BoardDTO boardDTO);
	List getBoardInfoList();
	void deleteBoardDTO(List list);
	BoardDTO detailBoardDTO(BoardDTO dto);
	void updateBoardDTO(BoardDTO dto);
	void travelNew(BoardDTO dto);
	List travelList();
	BoardDTO travelUpdate(BoardDTO dto);
	void setBoard(BoardDTO dto);
	void travelDelete(String[] boardDelete);
	List boardPick1(BoardDTO dto);
	List boardPick2(BoardDTO dto);
	List boardPick3(BoardDTO dto);
	List boardPick4(BoardDTO dto);
	public Map pageBoard(int pageNum, int countPerPage);
	public BoardDTO updatePage(BoardDTO boardDTO);
	public int deleteBoard(String delete);
	List popup1();
	Map popupReadyUpdate(Map map);
	void popupUpdate(Map map);
}
