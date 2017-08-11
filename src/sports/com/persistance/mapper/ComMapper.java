package sports.com.persistance.mapper;

import java.util.List;

import config.Mapper;
import sports.com.dto.ProductFileDTO;
import sports.com.dto.TestDTO;

@Mapper("ComMapper")
public interface ComMapper {

	List<TestDTO> getCommentList() throws Exception;

	void tran1() throws Exception;

	void tran2() throws Exception;

	ProductFileDTO getfile_grp() throws Exception;

	void file_reg(ProductFileDTO pdTO) throws Exception;
}
