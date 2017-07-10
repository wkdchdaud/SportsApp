package sports.com.persistance.mapper;

import java.util.List;
import config.Mapper;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.QADTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {
	
	List<ProductInfoDTO> getProductInfolist() throws Exception;
	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception; 
	
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoDelect(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception;
	
	
}
