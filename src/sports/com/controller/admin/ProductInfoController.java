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
	
	   /*
	    * ##########################################################################
	    * #                                관리자                                                              #
	    * ##########################################################################
	    * 
	    * */   
	
	
	/*리스트 controller*/
	
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
	
	
	/*디테일 controller*/
	
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


	/*등록 controller*/
	@RequestMapping(value="admin/ProductInfo/ProductInfoReg",method=RequestMethod.GET)
	public String ProductInfoReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		log.info(this.getClass().getName()+"productInfoProductinfoRegStart");

	
			
	
	log.info(this.getClass().getName()+"productInfoProductinfoRegEnd");
		return "/admin/ProductInfo/ProductInfoReg";
		
			}
	
	/*등록(insert) controller*/
	
	@RequestMapping(value="admin/ProductInfo/ProductInfoInsert",method=RequestMethod.POST)
	public String ProductInfoInsert(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		
		log.info(this.getClass().getName()+"productInfoProductinfoInsertStart");
		 String msg ="";
		 String url ="/admin/ProductInfo/List.do";
		 
		 try{
		
		 ProductInfoDTO rdto = new ProductInfoDTO();
		 


		
	   
		 String prod_name = CmmUtil.nvl(request.getParameter("prod_name"));
		 System.out.println("PROD_NAME  : " +  CmmUtil.nvl(request.getParameter("prod_name")));
		 
		 String prod_price =CmmUtil.nvl(request.getParameter("prod_price"));
		 System.out.println("PROD_PRICE  : " + CmmUtil.nvl(request.getParameter("prod_price")));
		 
		 String prod_contents =CmmUtil.nvl(request.getParameter("prod_contents"));
		 System.out.println("PROD_CONTENTS  : " + CmmUtil.nvl(request.getParameter("prod_contents")));
		 
	
		 rdto.setProd_price(prod_price);	
		 rdto.setProd_contents(prod_contents);
		 rdto.setProd_name(prod_name);
		 
		 
		 
		 productInfoService.ProductInfoInsert(rdto);
		 
		 
		 
		 msg = "등록 완료";
		 url ="/admin/ProductInfo/List.do";
		 
		 rdto= null;
		 
		 } catch(Exception e){
			 
		 msg = "등록 실패"+ e.toString();
		 url ="/admin/ProductInfo/List.do";
		
			log.info(e.toString());
			e.printStackTrace();
			
		 }
		 finally{
		
		log.info(this.getClass().getName()+"productInfoProductinfoInsertEnd");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		 }
		return "/redirect";
		
			}

	
	
	/*삭제 controller*/    
	@RequestMapping(value="admin/ProductInfo/ProductInfoDelete",method=RequestMethod.GET)
	public String ProductInfoDelete(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		log.info(this.getClass().getName()+"productInfoProductInfoDelect Start");
		 
		String msg ="";
		String url ="/admin/ProductInfo/List.do";
		 
		try{
			 
		String prod_no =CmmUtil.nvl(request.getParameter("prod_no1"));
		ProductInfoDTO rDTO =  new ProductInfoDTO();
		rDTO.setProd_no(prod_no);
		
		productInfoService.ProductInfoDelect(rDTO);
		
		
		 msg = "삭제완료";
		 url ="/admin/ProductInfo/List.do";
		 
		 
		 
		 rDTO= null;
		 
		 System.out.println("삭제완료");
		 } catch(Exception e){
			 
		 msg = "삭제 실패"+ e.toString();
		 url ="/admin/ProductInfo/List.do";
		
			log.info(e.toString());
			e.printStackTrace();
			
		 }
		 finally{
		
		log.info(this.getClass().getName()+"productInfoProductinfoDelectEnd");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		 }
		 return "/redirect";
		
			}
		
	
	
	/*수정controller*/    
	                     
	@RequestMapping(value="admin/ProductInfo/ProductInfoUpdateForm",method=RequestMethod.GET)
	public String ProductInfoUpdateForm(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		log.info(this.getClass().getName()+"productInfoProductinfoUpdateStart");

		String prod_no =CmmUtil.nvl(request.getParameter("prod_no1"));
		System.out.println("update prod_no : " + CmmUtil.nvl(request.getParameter("prod_no1")));
		
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		productInfoDTO.setProd_no(prod_no);
	
		List<ProductInfoDTO> list = productInfoService.getProductInfoDetail(productInfoDTO) ;
		
			
		model.addAttribute("dlwkdus",list);
		
		
	    log.info(this.getClass().getName()+"productInfoProductinfoUpdateEND");
	    
	    
	    
		 return "/admin/ProductInfo/ProductInfoUpdate";
		
			}
	
	
	
	
	
	@RequestMapping(value="admin/ProductInfo/ProductInfoUpdate",method=RequestMethod.POST)
	public String ProductInfoUpdate(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		
		
		log.info(this.getClass().getName()+"productInfoProductInfoDelect Start");
		
		 String msg ="";
		 String url ="admin/ProductInfo/ProductInfoDetail.do";
		 
		 try{
		
		 ProductInfoDTO rdto = new ProductInfoDTO();
		 
		/* String prod_no1 =CmmUtil.nvl(request.getParameter("prod_no1"));
		 System.out.println("PROD_no1  : " + prod_no1);*/
		 
		 String prod_no =CmmUtil.nvl(request.getParameter("prod_no"));
		 System.out.println("PROD_no1  : " + prod_no);
		 
		 String prod_name = CmmUtil.nvl(request.getParameter("prod_name"));
		 System.out.println("PROD_NAME  : " +  CmmUtil.nvl(request.getParameter("prod_name")));
		 
		 String prod_price =CmmUtil.nvl(request.getParameter("prod_price"));
		 System.out.println("PROD_PRICE  : " + CmmUtil.nvl(request.getParameter("prod_price")));
		 
		 String prod_contents =CmmUtil.nvl(request.getParameter("prod_contents"));
		 System.out.println("PROD_CONTENTS  : " + CmmUtil.nvl(request.getParameter("prod_contents")));
		 
		 rdto.setProd_no(prod_no);
		 rdto.setProd_price(prod_price);	
		 rdto.setProd_contents(prod_contents);
		 rdto.setProd_name(prod_name);
		 
		 
		 
		 productInfoService.ProductInfoUpdate(rdto);
		 
		 
		 
		 msg = "수정 완료";
		 url ="/admin/ProductInfo/List.do";
		 
		 rdto= null;
		 
		 } catch(Exception e){
			 
		 msg = "수정 실패"+ e.toString();
		 url ="/admin/ProductInfo/List.do";
		
			log.info(e.toString());
			e.printStackTrace();
			
		 }
		 finally{
		
		log.info(this.getClass().getName()+"productInfoProductinfoInsertEnd");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		 }
		return "/redirect";
		
	
		
		
		
		
	}
		
		
			}

    
    
