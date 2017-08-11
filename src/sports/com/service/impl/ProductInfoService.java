package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.Prod_test_jcmDTO;
import sports.com.dto.ProductFileDTO;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ProductInfoOptionDTO;
import sports.com.persistance.mapper.ProductInfoMapper;
import sports.com.service.IProductInfoService;

@Service("ProductInfoService")
public class ProductInfoService implements IProductInfoService {
	
	@Resource(name="ProductInfoMapper")
	private ProductInfoMapper productInfoMapper;
	
	//전체 리스트
	@Override
	public List<Prod_test_jcmDTO> getProductInfoList() throws Exception{
		return productInfoMapper.getProductInfolist();
	}
	
	//파라미터에 따른 리스트
	@Override
	public List<Prod_test_jcmDTO> getParameterList(Prod_test_jcmDTO pdto) throws Exception {
		return productInfoMapper.getParameterList(pdto);
	}
	
	//더보기 버튼 구현
	@Override
	public List<Prod_test_jcmDTO> getReadMore(Prod_test_jcmDTO pdto) throws Exception {
		return productInfoMapper.getReadMore(pdto);
	}
	
	@Override
	public ProductInfoDTO getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception{
		return productInfoMapper.getProductInfoDetail(productInfoDTO);
	}

	@Override
	public void ProductInfoInsert(ProductInfoDTO productInfoDTO) throws Exception {
		 productInfoMapper.ProductInfoInsert(productInfoDTO);
	}

	@Override
	public void ProductInfoDelect(ProductInfoDTO productInfoDTO) throws Exception {
		productInfoMapper.ProductInfoDelect(productInfoDTO);
	}


	@Override
	public void ProductInfoUpdate(ProductInfoDTO productInfoDTO) throws Exception {
		productInfoMapper.ProductInfoUpdate(productInfoDTO);
	}

	//조건선택검색
	@Override
	public List<Prod_test_jcmDTO> getAllSearch(Prod_test_jcmDTO bDTO) throws Exception {
		return productInfoMapper.getAllSearch(bDTO);
	}

	@Override
	public List<Prod_test_jcmDTO> getHighpriceSearch(Prod_test_jcmDTO bDTO) throws Exception {
		return productInfoMapper.getHighpriceSearch(bDTO);
	}

	@Override
	public List<Prod_test_jcmDTO> getLowpriceSearch(Prod_test_jcmDTO bDTO) throws Exception {
		return productInfoMapper.getLowpriceSearch(bDTO);
	}
	//조건선택검색 끝
	
	//옵션
	@Override
	public void ProductInfoOptionInsert(ProductInfoOptionDTO productInfoOptionDTO) throws Exception {
		productInfoMapper.ProductInfoOptionInsert(productInfoOptionDTO);
	}
	
	@Override
	public List<ProductFileDTO> getProductInfoFile(ProductInfoDTO rDTO) throws Exception {
		return productInfoMapper.getProductInfoFile(rDTO);
	}

}