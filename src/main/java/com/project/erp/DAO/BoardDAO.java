package com.project.erp.DAO;

import java.util.List;
import java.util.Map;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.BoardSearchDTO;
import com.project.erp.DTO.CommentDTO;

public interface BoardDAO {
	List<Map<String,String>> getBoardList(BoardSearchDTO boardSearchDTO);
	
	int getBoardListAllCnt(BoardSearchDTO boardSearchDTO);

	List<BoardDTO> getHeadCategory();

	int updateReadcount(int b_no);

	BoardDTO getBoard(int b_no);

	int insertBoard(BoardDTO boardDTO);

	int insertPicture(BoardDTO boardDTO);

	int getBoardCnt(BoardDTO boardDTO);

	String getPic(BoardDTO boardDTO);

	int deleteBoard(BoardDTO boardDTO);

	int updateBoard(BoardDTO boardDTO);

	int updatePicture(BoardDTO boardDTO);

	int deletePicture(BoardDTO boardDTO);

	int upInsertPicture(BoardDTO boardDTO);

	int updatePrintNo(CommentDTO commentDTO);

	int insertComment(CommentDTO commentDTO);

	int getCommentCnt(CommentDTO commentDTO);

	List<Map<String, String>> getCommentList(CommentDTO commentDTO);

	List<Map<String, String>> getNoticeList();

	int getCommentListAllCnt(CommentDTO commentDTO);

	int deleteComment(CommentDTO commentDTO);

	
}
