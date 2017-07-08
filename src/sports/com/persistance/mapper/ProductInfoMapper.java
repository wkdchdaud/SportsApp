package sports.com.persistance.mapper;

import java.util.List;
import config.Mapper;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.QADTO;

@Mapper("ProductInfoMapper")
public interface ProductInfoMapper {
	
	List<ProductInfoDTO> getProductInfolist() throws Exception;


	List<ProductInfoDTO> getProductInfoDetail(ProductInfoDTO productInfoDTO); 
	
}
