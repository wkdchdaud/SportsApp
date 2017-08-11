package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sports.com.dto.ProductFileDTO;
import sports.com.dto.TestDTO;
import sports.com.persistance.mapper.ComMapper;
import sports.com.service.IComService;

@Service("ComService")
public class ComService implements IComService{
	@Resource(name="ComMapper")
	private ComMapper comMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Override
	public List<TestDTO> getCommentList() throws Exception {
		return comMapper.getCommentList();
	}

	@Override
	public void tran() throws Exception {
		comMapper.tran1();
		comMapper.tran2();
	}

	@Override
	public void insertFileInfo(List<ProductFileDTO> file_list) throws Exception {
		ProductFileDTO proDTO = comMapper.getfile_grp();
		for(ProductFileDTO pdTO : file_list){
			pdTO.setFile_grp(proDTO.getFile_grp());
			comMapper.file_reg(pdTO);
		}
	}
}
