package sports.com.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.dto.ShoppingBasketDTO;
import sports.com.service.IBasketService;

@Controller
public class BasketController {
	private Logger log =Logger.getLogger(this.getClass());
	
	@Resource(name = "BasketService")
	private IBasketService basketService;
	
	@RequestMapping(value="admin/ShoppingBasket/ShoppingBasket",method=RequestMethod.GET)
	public String ShoppingBasketInfo(HttpServletRequest request, ModelMap model) throws Exception{
		return null;
	}
}
