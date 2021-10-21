package com.project.erp.Service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.CommentDTO;

public interface BoardService {

	BoardDTO getBoard(int b_no);

	int insertBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception;


	int deleteBoard(BoardDTO boardDTO);

	int updateBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception;

	int insertComment(CommentDTO commentDTO);

	int deleteComment(CommentDTO commentDTO);
	
}
