package sports.com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sports.com.dto.Ord_testDTO;
import sports.com.dto.R_testDTO;
import sports.com.persistance.mapper.AnalysisMapper;
import sports.com.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService{
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
		
		/*매출 분석 정보 시작 */
		// 매출분석정보 처음 접속시 뿌려지는 모리스 js 값과 테이블값
		@Override
			public List<R_testDTO> getSalesInfo() throws Exception{
				
				return 	analysisMapper.getSalesInfo();
		}
		@Override 
		public List<R_testDTO> getSaleRank() throws Exception{
			
			return analysisMapper.getSaleRank();
		}
		
		//아작스 일별 매출 분석 정보 모리스 js
		@Override
		public List<R_testDTO> sale_chart(R_testDTO rdto) throws Exception{
			
			return analysisMapper.sale_chart(rdto);
		}
		
		//아작스 일별 매출 분석 정보 테이블 매출 순위 
		@Override public List<R_testDTO> sale_table(R_testDTO rdto) throws Exception{
			
			return analysisMapper.sale_table(rdto);
		}
		/*연관성분석*/
		@Override
			public List<Ord_testDTO> getAnalysisList() throws Exception{
				return analysisMapper.getAnalysis();
			}
		
	}

