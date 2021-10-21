package com.project.erp.Util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

//************************************************
//파일업로드 관련 메소드를 제공하는 FileUpload 클래스 선언
//************************************************
public class FileUpload {
	//==========================================
	//업로드되는 파일을 관리하는 MultipartFile 객체의 메위주 저장할 속성변수 선언
	//업로드되는 파일의 새로운 이름을 저장할 속성변수 선언
	//==========================================
	private MultipartFile multi;
	
	private String newFileName;
	
	//==========================================
	//생성자(Constructor) 선언
	//<참고> 생성자는 객체 생성시 단 한번 호출된다. 이때 외부에서 데이터가 주입된다
	//==========================================
	// 생성자 : 외부에서 가져온 데이터를 속성변수에 집어 넣음(초기화)
	//생성자 만들면서 동시에 새로운 파일 이름 얻기
	public FileUpload(MultipartFile multi) {
		//매개변수로 들어온 MultipartFile 객체를 속성변수 multi에 저장하기
		this.multi = multi;
		
		//만약 업로드된 파일이 존재하면
		if(multi!=null && multi.isEmpty()==false) {
			//업로드한 파일의 원래 파일명 얻기. 파일명에는 확장자가 포함됨
			String oriFileName = multi.getOriginalFilename();
			
			//업로드한 파일의 파일 확장자 얻기
			String file_extension = oriFileName.substring( oriFileName.lastIndexOf(".")+1 );
			
			// 고유한 새 파일명 얻기. 파일명에는 파일 확장자 포함함
			// 시간을 사용하면 겹치지 않는 고유한(중복되지 않는) 새이름을 만들 수 있음
			// 이 또한 겹칠 수 있기 때문에 고유한 이름을 얻을 수 있는 자바의 클래스 사용
			newFileName = UUID.randomUUID()+"."+file_extension; 			
		}
	}
	//==========================================
	//속성변수 newFileName 안의 데이터를 리턴하는 메소드 선언
	//새로운 파일명을 리턴하는 메소드
	//==========================================
	public String getNewFileName() {
		
		return newFileName;
	}
	
	//------------------------------------------
	//속성변수 newFileName 안의 데이터를 리턴하는 메소드 선언
	//매개변수로 boolean값이 들어온다.
	//새로운 파일명을 리턴하는 메소드
		//=>메소드 오버로딩	
	//------------------------------------------
	public String getNewFileName(boolean flag) {
		//만약 매개변수로 들어온 데이터가 true이면 속성변수 newFileName 안의 데이터를 리턴
		//아니면 null 리턴하기
			return flag ? newFileName : null;
		}
	
	//------------------------------------------
	//업로드된 파일을 원하는 폴더에 새로운 이름으로 실제 저장하는 메소드 선언
	//------------------------------------------
	public void uploadFile( String uploadDir ) throws Exception {
		
		//매개변수로 들어온 저장경로 맨 뒤에 \가 없으면 넣어주기
		//if(uploadDir.lastIndexOf("\\")>=0) {
		if(uploadDir.endsWith("\\")==false) {
			uploadDir = uploadDir+"\\";
		}
		//만약 업로드된 파일이 있고, newFileName 속성변수 안에 데이터가 있으면
		if(multi!=null && multi.isEmpty()==false && newFileName!=null && newFileName.length()>0) {
			//새 파일을 생성하기. File 객체를 생성하면 새 파일을 생성할 수 있음
			
			File file = new File(uploadDir + newFileName);// 파일 경로를 포함한 생성 파일명
			//업로드한 파일을 새 파일에 전송하여 덮어쓰기
			multi.transferTo(file);
		}
		
	}
	
	//------------------------------------------
	//파일을 삭제하는 메소드 선언
	//------------------------------------------
	public void deleteFile( String filePath ) {
		// 삭제할 파일을 관리하는 파일객체 생성
		File file = new File(filePath);
		// File 객체의 delete 메소드 호출로 파일 삭제하기
		file.delete();
		
	}
	
	//------------------------------------------
	//파일을 삭제하는 메소드 선언
	//------------------------------------------
	public void deleteFile( String filePath, boolean flag ) {
		//만약에 두번째 매개변수로 들어온 데이터가 true면 
		if(flag==true) {
			//동료 메소드 중에 deleteFile 메소드 호출해서 파일 삭제하기
			deleteFile( filePath );
		}
	}
}
