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
		System.out.println("거래처 리스트 서비스 start");
		System.out.println("아카데미DTO 클래스는 "+AcademyDTO.class);
		return academyMapper.getAccountList();
	}
	 
	@Override
	public void AccountInsert(AcademyDTO aDTO) throws Exception {
		System.out.println("거래처 등록 서비스 start");
		academyMapper.AccountInsert(aDTO);
}

	public AcademyDTO getAccountInfo(AcademyDTO aDTO) throws Exception {
		System.out.println("거래처 상세 서비스 start");
		return academyMapper.getAccountInfo(aDTO);
	}
	@Override
	public boolean AcademyUpdateForm(AcademyDTO aDTO) throws Exception{
		int a =academyMapper.AcademyUpdateForm(aDTO);
		if(a != 0){
			return true;
		}
		return false;
		}
	
	@Override
	public boolean AcademyDelete(AcademyDTO aDTO) throws Exception {
		int b = academyMapper.AcademyDelete(aDTO);
		int a = academyMapper.AcademyDelete(aDTO);

		if (a != 0 && b != 0) {
			return true;
		}
		return false;
	}

}
