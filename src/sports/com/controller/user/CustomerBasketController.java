package sports.com.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.service.IBasketService;

@Controller
public class CustomerBasketController {
	private Logger log =Logger.getLogger(this.getClass());
	
	@Resource(name = "BasketService")
	private IBasketService basketService;
	
	@RequestMapping(value="basket/basket",method=RequestMethod.GET)
	public String basketInfo(HttpServletRequest request, ModelMap model) throws Exception{
		return "";
	}
}
