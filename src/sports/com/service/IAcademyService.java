package sports.com.service;

import java.util.List;

import sports.com.dto.AcademyDTO;

public interface IAcademyService {

	List<AcademyDTO> getAcaList() throws Exception;
	
	List<AcademyDTO> getAccountList() throws Exception;
	
	void AccountInsert(AcademyDTO aDTO) throws Exception;
	
	AcademyDTO getAccountInfo(AcademyDTO aDTO) throws Exception;



}
