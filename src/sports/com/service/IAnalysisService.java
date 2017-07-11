package sports.com.service;

import java.util.List;
import java.util.Map;

import sports.com.dto.R_testDTO;

public interface IAnalysisService {

	public Map<String, Object> getSalesInfo() throws Exception;
	
	public List<R_testDTO> getAnalysisList() throws Exception;
	
	
}
