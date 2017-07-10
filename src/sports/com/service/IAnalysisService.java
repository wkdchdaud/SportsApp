package sports.com.service;

import java.util.List;

import sports.com.dto.R_testDTO;

public interface IAnalysisService {

	public List<R_testDTO> getAnalysisList() throws Exception;
	
	public List<R_testDTO> getSalesInfo() throws Exception;
}
