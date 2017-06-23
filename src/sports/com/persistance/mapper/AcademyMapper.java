package sports.com.persistance.mapper;

import java.util.List;

import config.Mapper;
import sports.com.dto.AcademyDTO;

	@Mapper("AcademyMapper")
	public interface AcademyMapper {

		List<AcademyDTO> getAcaList() throws Exception;
		
		List<AcademyDTO> getAccountList() throws Exception;

		void AccountInsert(AcademyDTO aDTO) throws Exception;

		AcademyDTO getAccountInfo(AcademyDTO aDTO) throws Exception;
}

