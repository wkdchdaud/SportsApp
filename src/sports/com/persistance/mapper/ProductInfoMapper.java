package sports.com.persistance.mapper;

import java.util.List;
import config.Mapper;
import sports.com.dto.Prod_test_jcmDTO;
import sports.com.dto.ProductFileDTO;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ProductInfoOptionDTO;
import sports.com.dto.QADTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {
	
	List<Prod_test_jcmDTO> getProductInfolist() throws Exception;
	
	List<Prod_test_jcmDTO> getParameterList(Prod_test_jcmDTO pdto) throws Exception;
	
	//더보기 구현
	List<Prod_test_jcmDTO> getReadMore(Prod_test_jcmDTO pdto) throws Exception;
	
	ProductInfoDTO getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception; 
	
	void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoDelect(ProductInfoDTO productInfoDTO) throws Exception;
	
	void ProductInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception;
	
	//조건선택 검색
	List<Prod_test_jcmDTO> getAllSearch(Prod_test_jcmDTO bDTO) throws Exception;
	List<Prod_test_jcmDTO> getHighpriceSearch(Prod_test_jcmDTO bDTO) throws Exception;
	List<Prod_test_jcmDTO> getLowpriceSearch(Prod_test_jcmDTO bDTO) throws Exception;
	//조건선택 검색 끝
	
	//옵션구현 
	void ProductInfoOptionInsert(ProductInfoOptionDTO productInfoOptionDTO) throws Exception;

	List<ProductFileDTO> getProductInfoFile(ProductInfoDTO rDTO) throws Exception;

	List<ProductInfoOptionDTO> getProductInfoOption(ProductInfoOptionDTO productInfoOptionDTO)throws Exception;
	
}