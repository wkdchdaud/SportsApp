package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.QADTO;
import sports.com.persistance.mapper.QAMapper;
import sports.com.service.IQAService;

@Service("QAService")
public class QAService implements IQAService {
	
	@Resource(name="QAMapper")
	private QAMapper qaMapper;

	@Override
	public List<QADTO> getQAList() throws Exception {
		return qaMapper.getQAList();
	}
	
	@Override
	public void insertQADetail(QADTO qaDTO) throws Exception {
		qaMapper.insertQADetail(qaDTO);
	}
	
	@Override
	public QADTO getQADetail(QADTO qaDTO) throws Exception {
		return qaMapper.getQADetail(qaDTO);
	}
	
	@Override
	public void updateQADetail(QADTO qaDTO) throws Exception {
		qaMapper.updateQADetail(qaDTO);
	}
	
	@Override
	public void deleteQADetail(QADTO qaDTO) throws Exception {
		qaMapper.deleteQADetail(qaDTO);
	}
	
}