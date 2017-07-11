package sports.com.service.impl;

import java.util.List;

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
		public List<R_testDTO> getAnalysisList() throws Exception{
			return analysisMapper.getAnalysis();
		}
		
	}

