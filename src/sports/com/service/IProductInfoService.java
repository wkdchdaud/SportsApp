package sports.com.service;

import java.util.List;

import sports.com.dto.Prod_test_jcmDTO;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ProductInfoOptionDTO;

public interface IProductInfoService {
	
	
	List<Prod_test_jcmDTO> getProductInfoList() throws Exception;
	List<Prod_test_jcmDTO> getParameterList(Prod_test_jcmDTO pdto) throws Exception;
	
	//버튼 더보기 구현
	List<Prod_test_jcmDTO> getReadMore(Prod_test_jcmDTO pdto) throws Exception;
	
	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception;
   
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;

	void ProductInfoDelect(ProductInfoDTO productInfoDTO)throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO)throws Exception;

	//조건선택 검색
	List<Prod_test_jcmDTO> getAllSearch(Prod_test_jcmDTO bDTO) throws Exception;
	List<Prod_test_jcmDTO> getHighpriceSearch(Prod_test_jcmDTO bDTO) throws Exception;
	List<Prod_test_jcmDTO> getLowpriceSearch(Prod_test_jcmDTO bDTO) throws Exception;
	
	//옵션 등록 
	void ProductInfoOptionInsert(ProductInfoOptionDTO productInfoOptionDTO) throws Exception;
	
	List<ProductInfoOptionDTO> getProductInfoOption(ProductInfoOptionDTO productInfoOptionDTO) throws Exception;
	
	
}
