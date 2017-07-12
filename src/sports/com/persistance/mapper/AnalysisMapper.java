package sports.com.persistance.mapper;

import java.util.List;

import config.Mapper;
import sports.com.dto.R_testDTO;;

@Mapper("AnalysisMapper")
public interface AnalysisMapper {
	/*매출데이터 분석*/
	public List<R_testDTO> getSalesInfo() throws Exception;
	public List<R_testDTO> getSaleRank() throws Exception;
	//아작스 일별 매출 분석 정보
	public List<R_testDTO> sale_chart(R_testDTO rdto) throws Exception;
	
	/*연관성분석*/
	public List<R_testDTO> getAnalysis() throws Exception;
	
	
	
}
