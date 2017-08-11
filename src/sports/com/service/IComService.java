package sports.com.service;

import java.util.List;

import sports.com.dto.ProductFileDTO;
import sports.com.dto.TestDTO;

public interface IComService {

	List<TestDTO> getCommentList() throws Exception;

	void tran() throws Exception;

	void insertFileInfo(List<ProductFileDTO> file_list) throws Exception;

}
