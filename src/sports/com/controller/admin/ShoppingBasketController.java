package sports.com.controller.admin;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ShoppingBasketDTO;
import sports.com.service.IShoppingBasketService;
import sports.com.util.CmmUtil;

@Controller
public class ShoppingBasketController {
	private Logger log =Logger.getLogger(this.getClass());
	
	@Resource(name = "ShoppingBasketService")
	private IShoppingBasketService shoppingBasketService;
	
	@RequestMapping(value="admin/ShoppingBasket/ShoppingBasket",method=RequestMethod.GET)
	public String ShoppingBasketInfo(HttpServletRequest request, ModelMap model) throws Exception
	{
		 String prod_no="1000005" ;
		 String[] opt_no={"10000001","10000002"};
		
		 List<ShoppingBasketDTO> sbList = shoppingBasketService.getShoppingBasketList();
		 
		 List<ShoppingBasketDTO> opList = shoppingBasketService.getShoppingBasketOptionList();
		
		return null;
	}
}
