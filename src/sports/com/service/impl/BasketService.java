package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.ShoppingBasketDTO;
import sports.com.persistance.mapper.NoticeMapper;
import sports.com.persistance.mapper.BasketMapper;
import sports.com.service.INoticeService;
import sports.com.service.IBasketService;

@Service("BasketService")
public class BasketService implements IBasketService{

	@Resource(name="BasketMapper")
	private BasketMapper basketMapper;

	@Override
	public List<ShoppingBasketDTO> getShoppingBasketList() throws Exception {
		return null;
	}

	@Override
	public List<ShoppingBasketDTO> getShoppingBasketOptionList() throws Exception {
		return null;
	}
	
}
