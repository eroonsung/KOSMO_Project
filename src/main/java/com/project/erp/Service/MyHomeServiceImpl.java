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
import com.project.erp.DAO.MyHomeDAO;
import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.MyHomeDTO;
import com.project.erp.Util.FileUpload;

@Service
@Transactional
public class MyHomeServiceImpl implements MyHomeService  {

	@Autowired
	private MyHomeDAO myHomeDAO;

	@Override
	public int updateMyHome(MyHomeDTO myHomeDTO) {
		int updateRentalCnt = this.myHomeDAO.updateRental(myHomeDTO);
		int myHomeUpDelCnt = this.myHomeDAO.updateRentalDetail(myHomeDTO);
		return myHomeUpDelCnt;
	}

}
