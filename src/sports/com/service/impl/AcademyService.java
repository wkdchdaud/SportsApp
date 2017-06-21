package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sports.com.dto.AcademyDTO;
import sports.com.persistance.mapper.AcademyMapper;
import sports.com.service.IAcademyService;

@Service("AcademyService")
public class AcademyService implements IAcademyService{
	@Resource(name="AcademyMapper")
	private AcademyMapper academyMapper;
	
	private Logger log = Logger.getLogger(this.getClass()); 
	
	@Override
	public List<AcademyDTO> getAcaList() throws Exception {
		return academyMapper.getAcaList();
	
	}
		
	@Override
	public List<AcademyDTO> getAccountList() throws Exception {
		System.out.println("acc 서비스 start");
		return academyMapper.getAcaList();
	}
	
	@Override
	public void AccountInsert(AcademyDTO aDTO) throws Exception {
		System.out.println("acc 서비스 start");
		academyMapper.AccountInsert(aDTO);
}
}
