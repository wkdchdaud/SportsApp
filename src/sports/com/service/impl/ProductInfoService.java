package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.ProductInfoDTO;
import sports.com.persistance.mapper.ProductInfoMapper;
import sports.com.service.IProductInfoService;

@Service("ProductInfoService")
public class ProductInfoService implements IProductInfoService {
	
	@Resource(name="ProductInfoMapper")
	private ProductInfoMapper productInfoMapper;
	
	@Override
	public List<ProductInfoDTO> getProductInfoList() throws Exception{
		
		return productInfoMapper.getProductInfolist();
	}
	
	//더보기 버튼 구현
	@Override
	public List<ProductInfoDTO> getReadMore(ProductInfoDTO pdto) throws Exception {
		
		return productInfoMapper.getReadMore(pdto);
	}
	
	
	@Override
	public List<ProductInfoDTO>  getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception{
		
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


	@Override
	public List<ProductInfoDTO> getAllSearch(ProductInfoDTO bDTO) throws Exception {
	
		return productInfoMapper.getAllSearch(bDTO);
	}


	@Override
	public List<ProductInfoDTO> getHighpriceSearch(ProductInfoDTO bDTO) throws Exception {
	
		return productInfoMapper.getHighpriceSearch(bDTO);
	}


	@Override
	public List<ProductInfoDTO> getLowpriceSearch(ProductInfoDTO bDTO) throws Exception {

		return productInfoMapper.getLowpriceSearch(bDTO);
	}







}
