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

import sports.com.dto.ProductInfoDTO;
import sports.com.service.IProductInfoService;
import sports.com.util.CmmUtil;

@Controller
public class ProductInfoController {
	private Logger log =Logger.getLogger(this.getClass());
	
	@Resource(name = "ProductInfoService")
	private IProductInfoService productInfoService;
	
	@RequestMapping(value="admin/ProductInfo/List",method=RequestMethod.GET)
	public String ProductInfoList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
	
	{
		
		log.info(this.getClass().getName() + ".ProductInfoList start");
		
		
		List<ProductInfoDTO> RList = productInfoService.getProductInfoList();
		
		if(RList==null){
			RList = new ArrayList<ProductInfoDTO>();
			
		}
		
		model.addAttribute("DLWKDUS",RList);
		
		RList= null;
		
		log.info(this.getClass().getName()+"ProductInfoList end");
		
		
		return "/admin/ProductInfo/ProductInfoList";
	}
	
	
	
	@RequestMapping(value="admin/ProductInfo/ProductInfoDetail",method=RequestMethod.GET)
	public String ProductInfoDetail(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
	{
		
		
		log.info(this.getClass().getName()+"productinfoDetail start");
		
		String prod_no =CmmUtil.nvl(request.getParameter("prod_no1"));
		
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		
		
		productInfoDTO.setProd_no(prod_no);
		
		List<ProductInfoDTO> list = productInfoService.getProductInfoDetail(productInfoDTO) ;
		
				
				model.addAttribute("dlwkdus",list);
		
		
		
		
	
		
					return "/admin/ProductInfo/ProductInfoDetail";	  
					
					
}
}
