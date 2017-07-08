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
	
	
	@Override
	public List<ProductInfoDTO>  getProductInfoDetail(ProductInfoDTO productInfoDTO) throws Exception{
		
		return productInfoMapper.getProductInfoDetail(productInfoDTO);
	}
	

}
