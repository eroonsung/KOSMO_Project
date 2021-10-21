package com.project.erp.Service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.project.erp.DTO.BoardDTO;
import com.project.erp.DTO.MyHomeDTO;

public interface MyHomeService {

	int updateMyHome(MyHomeDTO myHomeDTO);

}
