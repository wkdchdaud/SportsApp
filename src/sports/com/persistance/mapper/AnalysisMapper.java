package sports.com.persistance.mapper;

import java.util.List;

import config.Mapper;
import sports.com.dto.R_testDTO;;

@Mapper("AnalysisMapper")
public interface AnalysisMapper {

	public List<R_testDTO> getAnalysis() throws Exception;
	
}
