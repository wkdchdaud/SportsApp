package sports.com.service;

import java.util.List;

import sports.com.dto.ShoppingBasketDTO;

public interface IShoppingBasketService {

	List<ShoppingBasketDTO> getShoppingBasketList() throws Exception;

	List<ShoppingBasketDTO> getShoppingBasketOptionList() throws Exception;

}
