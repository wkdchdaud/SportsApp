package sports.com.service;

import java.util.List;

import sports.com.dto.ProductInfoDTO;

public interface IProductInfoService {
	
	
	List<ProductInfoDTO> getProductInfoList() throws Exception;
	
	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception;
   
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;

	void ProductInfoDelect(ProductInfoDTO productInfoDTO)throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO)throws Exception;

	//조건선택 검색
	List<ProductInfoDTO> getAllSearch(ProductInfoDTO bDTO) throws Exception;
	List<ProductInfoDTO> getHighpriceSearch(ProductInfoDTO bDTO) throws Exception;
	List<ProductInfoDTO> getLowpriceSearch(ProductInfoDTO bDTO) throws Exception;
	
	
}
