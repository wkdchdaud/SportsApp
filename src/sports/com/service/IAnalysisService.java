package sports.com.service;

import java.util.List;
import java.util.Map;

import sports.com.dto.Ord_testDTO;
import sports.com.dto.R_testDTO;

public interface IAnalysisService {

	/*매출 분석 정보 시작 */
	// 매출분석정보 처음 접속시 뿌려지는 모리스 js 값과 테이블값
	public List<R_testDTO> getSalesInfo() throws Exception;
	public List<R_testDTO> getSaleRank() throws Exception;
	
	
	//아작스 일별 매출 분석 정보 모리스 js
	public List<R_testDTO> sale_chart(R_testDTO rdto) throws Exception;
	
	//아작스 일별 매출 분석 정보 테이블 매출 순위 
	public List<R_testDTO> sale_table(R_testDTO rdto) throws Exception;
	
	/*연관성분석*/
	public List<Ord_testDTO> getAnalysisList() throws Exception;
	
	
}
