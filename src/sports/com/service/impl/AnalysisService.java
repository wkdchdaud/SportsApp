package sports.com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sports.com.dto.R_testDTO;
import sports.com.persistance.mapper.AnalysisMapper;
import sports.com.service.IAnalysisService;

@Service("AnalysisService")
public class AnalysisService implements IAnalysisService{
	@Resource(name="AnalysisMapper")
	private AnalysisMapper analysisMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
		public List<R_testDTO> getSalesInfo() throws Exception{
		//Map<String, Object> map= new HashMap<String, Object>();
		//map.put("sale_Info", analysisMapper.getSalesInfo() );
	    //map.put("sale_Rank", analysisMapper.getSaleRank());
			analysisMapper.getSalesInfo();
			
			return 	analysisMapper.getSalesInfo();
		}
		@Override 
		public List<R_testDTO> getSaleRank() throws Exception{
			
			return analysisMapper.getSaleRank();
		}
		
	@Override
		public List<R_testDTO> getAnalysisList() throws Exception{
			return analysisMapper.getAnalysis();
		}
		
	}

