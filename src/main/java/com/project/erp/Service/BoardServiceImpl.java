package com.project.erp.Service;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.erp.DAO.BoardDAO;
import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.CommentDTO;
import com.project.erp.Util.FileUpload;

@Service
@Transactional
public class BoardServiceImpl implements BoardService  {

	@Autowired
	private BoardDAO boardDAO;
	
	String uploadDir = "C:\\xxx\\Project_1_1015\\Project\\src\\main\\resources\\static\\resources\\img\\";
	
	@Override
	public BoardDTO getBoard(int b_no) {
		//트랜잭션이 걸리는 층 
		// -> SQL 구문이 여러개이면 SQL구문 1개씩 나눠서 DB연동 지시(update, select)
		
		//-------------------------------------------------
		//[BoardDAOImpl 객체]의 updateReadcount 메소드를 호출하여 [조회수를 증가하고]
		// 수정한 행의 개수를 얻는다.
		//-------------------------------------------------
		int updateCnt= this.boardDAO.updateReadcount(b_no);
		
		//-------------------------------------------------
		//수정한 행의 개수가 0이면 null 리턴하기
		// 즉 대상 게시판 글을 누군가 삭제했다면 null 리턴하기
		//-------------------------------------------------
		if(updateCnt==0) {return null;}
		
		//-------------------------------------------------
		//[BoardDAOImpl 객체]의 getBoard 메소드를 호출하여 [1개 게시판 글]을 얻는다.
		//-------------------------------------------------
		BoardDTO boardDTO = this.boardDAO.getBoard(b_no);
		
		//-------------------------------------------------
		//[1개 게시판 글]이 저장된 BoardDTO 객체 리턴하기
		//-------------------------------------------------
		return boardDTO;
	}

	@Override
	public int insertBoard(BoardDTO boardDTO, MultipartFile multi) throws Exception {
		//-------------------------------------------------
		//사용자 정의 FileUpload 객체 생성하기
		//-------------------------------------------------		
		FileUpload fileUpload = new FileUpload(multi);
		//-------------------------------------------------
		//boardDTO 안에 newFileName을 저장함
		//-------------------------------------------------
		boardDTO.setPic(fileUpload.getNewFileName());
		
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		//-------------------------------------------------
		//BoardDAOImpl 객체의 insertBoard 메소드를 호출하여 게시판 글 입력 후 입력 적용 행의 개수 얻기
		//만약 insertBoard가 실패하면 위의 updatePrintNo도 취소됨
		//-------------------------------------------------
		int boardRegCnt = this.boardDAO.insertBoard(boardDTO);
		if(boardDTO.getPic()!=null && boardDTO.getPic().length()>0) {
			int pictureRegCnt = this.boardDAO.insertPicture(boardDTO);
		}
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		
		//-------------------------------------------------
		//파일업로드 하기
		// DB연동 이후 파일업로드를 하는 이유
		// DB연동에서 에러가 발생한 경우 트랜잭션과 어울려 파일업로드가 되지 않음
		// <참고> 만약 DB연동 전에 파일업로드가 될 경우 파일 업로드 이후 DB연동에서 에러가 발생하면
		// 			파일업로드를 취소 할 수 없음
		//-------------------------------------------------
		fileUpload.uploadFile(uploadDir);
		
		//-------------------------------------------------
		//1개 게시판 글 입력 적용 행의 개수 리턴하기
		//-------------------------------------------------		
		return boardRegCnt;
	}
	

	public int updateBoard (BoardDTO boardDTO, MultipartFile multi) throws Exception{
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		//-------------------------------------------------
		//[BoardDAOImpl 객체]의 getBoardCnt 메소드를 호출하여
		// 수정할 게시판의 존재 개수를 얻는다.
		//-------------------------------------------------
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
			// 게시판이 존재하지 않으면 -1을 리턴
		if(boardCnt==0) {return -1;}
		
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		
		//-------------------------------------------------
		//사용자 정의 FileUpload 객체 생성하기
		//-------------------------------------------------		
		FileUpload fileUpload = new FileUpload(multi);
		//-------------------------------------------------
		//업로드한 파일의 새로운 이름 구하기
		//-------------------------------------------------
		String newFileName = null;
		//-------------------------------------------------
		//삭제 체크 여부 구하기
		//만약에 삭제가 체크되어 있지 않으면
		//-------------------------------------------------
		String is_del = boardDTO.getIs_del();
		/*
		if(is_del==null) {
			//업로드한 파일의 새로운 이름 구하기
			// BoardDTO 객체에 새로운 파일명 저장하기
			newFileName = fileUpload.getNewFileName();
			boardDTO.setPic(newFileName);
		}
		*/
		newFileName = fileUpload.getNewFileName(is_del==null);
		boardDTO.setPic(newFileName);
		
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		//-------------------------------------------------
		// board테이블에 있는 기존 이미지 이름 가져오기
		//-------------------------------------------------
		String pic = this.boardDAO.getPic(boardDTO);
		String newPic = boardDTO.getPic();
		
		//-------------------------------------------------
		//[BoardDAOImpl 객체]의 updateBoard 메소드를 호출하여 
		//게시판 글 수정 후 입력 수정 행의 개수 얻기
		//-------------------------------------------------
		int updateCnt = this.boardDAO.updateBoard(boardDTO);
		
		//기존 사진 있으면 사진 update
		if(pic!=null && pic.length()>0) {
			if(is_del==null) {
				if(newPic!=null && newPic.length()>0) {
					int updatePicCnt = this.boardDAO.updatePicture(boardDTO);
				}
			}
			else {
				int deletePicCnt = this.boardDAO.deletePicture(boardDTO);
			}
		}
		//기존 사진 없으면 사진 insert
		else {
			if(newPic!=null && newPic.length()>0) {
				int pictureRegCnt = this.boardDAO.upInsertPicture(boardDTO);
			}
		}
		//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
		
		//-------------------------------------------------
		//파일 업로드 하기
		//업로드 된 파일을 두고 새로운 파일을 만든 후 업로드된 파일을 그대로 오려내서 새로운 파일에 덮어쓰기(stream)
		//-------------------------------------------------
		//is_del이 체크가 안되어 있으면
		if(is_del==null) {
			//만약 업로드된 파일이 있으면
			
			//if(multi!=null && multi.isEmpty()==false) {
				//-------------------------------------------------
				//기존 이미지 파일 삭제하기
				//-------------------------------------------------
				// board테이블에 이미지 이름이 있으면 파일 삭제하기
				/*
				if(pic!=null && pic.length()>0) {
					fileUpload.deleteFile(uploadDir+pic);
				}
				*/
				// 두번째 인자가 true일 경우에만 지워짐
				fileUpload.deleteFile(
						uploadDir+pic
						, multi!=null && multi.isEmpty()==false && pic!=null && pic.length()>0);
				//-------------------------------------------------
				//파일 업로드하기
				//-------------------------------------------------
				fileUpload.uploadFile(uploadDir);
			//}
		
		
		}
		//is_del이 체크가 되어 있으면
		else {
			//-------------------------------------------------
			//기존 이미지 파일 삭제하기
			//-------------------------------------------------
			/*
			if(pic!=null && pic.length()>0) {
				fileUpload.deleteFile(uploadDir+pic);
			}
			*/
			
			fileUpload.deleteFile(uploadDir+pic, pic!=null && pic.length()>0);
		}
		
		return updateCnt;
	}
	
	
	public int deleteBoard(BoardDTO boardDTO) {
		int boardCnt = this.boardDAO.getBoardCnt(boardDTO);
		if(boardCnt==0) {return -2;}
		
		
		String pic = this.boardDAO.getPic(boardDTO);
		
		int deleteCnt = this.boardDAO.deleteBoard(boardDTO);
		System.out.println("deleteCnt : "+deleteCnt);
		if(pic!=null&&pic.length()>0) {
			File file = new File(uploadDir+pic);
			file.delete();
		}
		
		return deleteCnt;
		
	}

	@Override
	public int insertComment(CommentDTO commentDTO) {
		int commentRegCnt = this.boardDAO.insertComment(commentDTO);
		return commentRegCnt;
	}

	@Override
	public int deleteComment(CommentDTO commentDTO) {
		int commentCnt = this.boardDAO.getCommentCnt(commentDTO);
		if(commentCnt==0) {return -1;}
		int deleteCnt = this.boardDAO.deleteComment(commentDTO);
		
		return deleteCnt;
	}

	
	


}
