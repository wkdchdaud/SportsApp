package sports.com.service;

import java.util.List;

import sports.com.dto.ProductInfoDTO;

public interface IProductInfoService {
	
	
	List<ProductInfoDTO> getProductInfoList() throws Exception;
	
	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception;
   
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;

	void ProductInfoDelect(ProductInfoDTO productInfoDTO)throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO)throws Exception;

    
}