package sports.com.persistance.mapper;

import java.util.List;
import config.Mapper;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ProductInfoOptionDTO;
import sports.com.dto.QADTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {
	
	List<ProductInfoDTO> getProductInfolist() throws Exception;
	

	
	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception; 
	
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoDelect(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception;
	
	//더보기 구현
	List<ProductInfoDTO> getReadMore(ProductInfoDTO pdto) throws Exception;
	
	List<ProductInfoDTO> getAllSearch(ProductInfoDTO bDTO) throws Exception;
	
	List<ProductInfoDTO> getHighpriceSearch(ProductInfoDTO bDTO) throws Exception;
	
	List<ProductInfoDTO> getLowpriceSearch(ProductInfoDTO bDTO) throws Exception;
	
	//옵션구현 
	void ProductInfoOptionInsert(ProductInfoOptionDTO productInfoOptionDTO) throws Exception;
}
