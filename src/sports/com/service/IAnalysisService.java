package sports.com.service;

import java.util.List;
import java.util.Map;

import sports.com.dto.R_testDTO;

public interface IAnalysisService {

	public List<R_testDTO> getSalesInfo() throws Exception;
	
	public List<R_testDTO> getAnalysisList() throws Exception;
	
	public List<R_testDTO> sale_chart(R_testDTO rdto) throws Exception;

	public List<R_testDTO> getSaleRank() throws Exception;
	
	
}
