package sports.com.service;

import java.util.List;

import sports.com.dto.QADTO;

public interface IQAService {
	
	List<QADTO> getQAList() throws Exception;

	void insertQADetail(QADTO qaDTO) throws Exception;

	QADTO getQADetail(QADTO qaDTO) throws Exception;
	
	void updateQADetail(QADTO qaDTO) throws Exception;
	
	void deleteQADetail(QADTO qaDTO) throws Exception;
	
}