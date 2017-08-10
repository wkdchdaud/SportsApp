package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.ShoppingBasketDTO;
import sports.com.persistance.mapper.NoticeMapper;
import sports.com.persistance.mapper.ShoppingBasketMapper;
import sports.com.service.INoticeService;
import sports.com.service.IShoppingBasketService;

@Service
public class ShoppingBasketService implements IShoppingBasketService{

	@Resource(name="ShoppingBasket")
	private NoticeMapper shoppingBasket;

	@Override
	public List<ShoppingBasketDTO> getShoppingBasketList() throws Exception {
		return null;
	}

	@Override
	public List<ShoppingBasketDTO> getShoppingBasketOptionList() throws Exception {
		return null;
	}
	
}
