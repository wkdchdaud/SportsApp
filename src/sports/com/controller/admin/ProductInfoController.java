package sports.com.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import sports.com.dto.Prod_test_jcmDTO;
import sports.com.dto.ProductFileDTO;
import sports.com.dto.ProductInfoDTO;
import sports.com.dto.ProductInfoOptionDTO;
import sports.com.dto.QADTO;
import sports.com.service.IProductInfoService;
import sports.com.util.AES256Util;
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
	
	/* 전체 리스트 Controller */
	@RequestMapping(value="admin/ProductInfo/List",method=RequestMethod.GET)
	public String ProductInfoList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//장총명 8 월 10일 구현중.
		
		log.info(this.getClass().getName() + "전체 .ProductInfoList start");
		
		
		List<Prod_test_jcmDTO> RList = productInfoService.getProductInfoList();
		
		if(RList==null){
			RList = new ArrayList<Prod_test_jcmDTO>();
			
		}
		
		model.addAttribute("DLWKDUS",RList);
		
		RList= null;
		
		log.info(this.getClass().getName()+"ProductInfoList end");
		
		
		return "/admin/ProductInfo/sports_goods";
		
		//장총명 8 월 10일 구현중.
		
	}
	
	/* 파라미터에 따른 리스트 Controller */
	@RequestMapping(value="admin/ProductInfo/List_value",method=RequestMethod.GET)
	public String parameter_list(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		//장총명 8 월 10일 구현중 파라미터에 따른 리스트 값 뽑기.
		String par = new String(request.getParameter("par").getBytes("ISO-8859-1"), "UTF-8");

		log.info("파라미터에 따른 list gogogo Start!!!!!!!");
		
		System.out.println("넘어온 par : "+ par);
		
		Prod_test_jcmDTO pdto = new Prod_test_jcmDTO();
		pdto.setProd_category(par);
		
		System.out.println("set 후 get par 값 : " + pdto.getProd_category());
		
		List<Prod_test_jcmDTO> RList = productInfoService.getParameterList(pdto);
		
		model.addAttribute("DLWKDUS",RList);
		
		RList= null;
		
		log.info(this.getClass().getName()+"파라미터에 따른 리스트 값 끝");
		
		return "/admin/ProductInfo/sports_goods";
		
		//장총명 8 월 10일 구현중.
		
	}
	
    /* 더보기 Controller */
		@RequestMapping(value="admin/ProductInfo/readMore")
		public @ResponseBody List<Prod_test_jcmDTO> getReadMore(@RequestParam(value="cnt") String cnt,@RequestParam(value="price") String price,@RequestParam(value="name") String name,@RequestParam(value="catname") String catname) throws Exception{
			
			System.out.println("버튼 리드 모어 고고고고고");
			
			Prod_test_jcmDTO pdto = new Prod_test_jcmDTO();
			pdto.setRead_more(cnt);
			pdto.setSearch(name);
			pdto.setDel_price(price);
			pdto.setProd_category(catname);
			
			List<Prod_test_jcmDTO> plist = productInfoService.getReadMore(pdto);
			
			System.out.println("cnt : : "+pdto.getRead_more());
			System.out.println("search : "+pdto.getSearch());
			System.out.println("price : "+pdto.getDel_price());
			System.out.println("catname : "+pdto.getProd_category());
			
			pdto = null;
			
			return plist;
			
	}
		
	/* 전체 리스트 검색 controller */    
	@RequestMapping(value = "admin/ProductInfo/allSearch")
	public @ResponseBody List<Prod_test_jcmDTO> allSearch(@RequestParam(value = "price") String price,@RequestParam(value="name") String name) throws Exception {
		
			log.info(this.getClass().getName() + "all Search Start !!");
			log.info(name);
			
	
			Prod_test_jcmDTO bDTO = new Prod_test_jcmDTO();
			System.out.println("allSearch");
			System.out.println("price : " + price);
			System.out.println("name : " + name);
			
			bDTO.setProd_name(name);
			
			bDTO.setPrice(price);
			
			System.out.println("get name :"+bDTO.getProd_name());
			System.out.println("get sele : "+ bDTO.getPrice());
			
			List<Prod_test_jcmDTO> RList = productInfoService.getAllSearch(bDTO);
			System.out.println("안녕 : RList size : "+RList.size());
			
			if(RList==null){
				RList = new ArrayList<Prod_test_jcmDTO>();
				
			}
		
			
			log.info(this.getClass().getName()+"all Search end");
			
				
		  return RList;
		  
	}
	
	/* 전체 리스트 낮은 가격순 Controller */
	@RequestMapping(value = "admin/ProductInfo/lowpriceSearch")
	public @ResponseBody List<Prod_test_jcmDTO> lowpriceSearch(@RequestParam(value = "price") String price,@RequestParam(value="name") String name) throws Exception {
		
			log.info(this.getClass().getName() + "low Search Start !!");
			log.info(name);
			
	
			Prod_test_jcmDTO bDTO = new Prod_test_jcmDTO();
			System.out.println("price : " + price);
			System.out.println("name : " + name);
			if(name==""){
				System.out.println("hello null");
			}
			bDTO.setProd_name(name);
			bDTO.setPrice(price);
			System.out.println("get name :"+bDTO.getProd_name());
			System.out.println("get sele : "+ bDTO.getPrice());
			List<Prod_test_jcmDTO> RList = productInfoService.getLowpriceSearch(bDTO);
			System.out.println("안녕"+RList.size());
			
			if(RList==null){
				RList = new ArrayList<Prod_test_jcmDTO>();
				
			}
			
			log.info(this.getClass().getName()+"low Search end");
			
				
			
		  return RList;
		  
	}
	
	/* 전체 리스트 높은 가격순 Controller */
	@RequestMapping(value = "admin/ProductInfo/highpriceSearch")
	public @ResponseBody List<Prod_test_jcmDTO> highpriceSearch(@RequestParam(value = "price") String price, @RequestParam(value="name") String name) throws Exception {
		
			log.info(this.getClass().getName() + "highpriceSearch Start !!");
			log.info(name);
			
			
			Prod_test_jcmDTO bDTO = new Prod_test_jcmDTO();
			System.out.println("price : " + price);
			System.out.println("name : " + name);
			bDTO.setProd_name(name);
			bDTO.setPrice(price);
			List<Prod_test_jcmDTO> RList = productInfoService.getHighpriceSearch(bDTO);
			System.out.println("안녕"+RList.size());
			if(RList==null){
				RList = new ArrayList<Prod_test_jcmDTO>();
				
			}
			
			log.info(this.getClass().getName()+"highpriceSearch end");
			
			
		  return RList;
		  
	}
		
	/* 상세 Controller */
	@RequestMapping(value="admin/ProductInfo/ProductInfoDetail",method=RequestMethod.GET)
	public String ProductInfoDetail(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
		
		log.info(this.getClass().getName()+"productinfoDetail start");
		
		String prod_no =CmmUtil.nvl(request.getParameter("prod_no1"));
		
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		ProductInfoOptionDTO ProductInfoOptionDTO = new ProductInfoOptionDTO();
		
		ProductInfoOptionDTO.setProd_no(prod_no);
		productInfoDTO.setProd_no(prod_no);
		
		ProductInfoDTO rDTO = productInfoService.getProductInfoDetail(productInfoDTO);
		
		List<ProductInfoOptionDTO> oDTO = productInfoService.getProductInfoOption(ProductInfoOptionDTO);
		
		List<ProductFileDTO> fileList = productInfoService.getProductInfoFile(rDTO);
		
		log.info(this.getClass().getName()+"productinfoDetail end");
		
		model.addAttribute("dlwkdus", rDTO);
		model.addAttribute("oList", oDTO);
		model.addAttribute("file", fileList);
		
		return "/admin/ProductInfo/ProductDetail";	  
       }
		
	
	/* 상세 옵션&수량 Controller */
	@RequestMapping(value="/admin/Product/ProductDetailOpt")
	public @ResponseBody List<ProductInfoDTO> getProductDetailOption(@RequestParam(value="option") String option) throws Exception {
		
		System.out.println("option: " + option);
		
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		
		productInfoDTO.setOption(option);
		
		List<ProductInfoDTO> detail_option = productInfoService.getProductDetailOption(productInfoDTO);
		
		for (ProductInfoDTO optDTO : detail_option) {
			
			
			
		}	
		
		System.out.println("option: " + option);
		
		productInfoDTO = null;
		
		return detail_option;
		
	}
	
	

	/* 등록 Controller */
	@RequestMapping(value="admin/ProductInfo/ProductInfoReg",method=RequestMethod.GET)
	public String ProductInfoReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName()+"productInfoProductinfoRegStart");
			
	
		log.info(this.getClass().getName()+"productInfoProductinfoRegEnd");
		
		return "/admin/ProductInfo/ProductInfoReg";
		
	}
	
	/* 등록(Insert) Controller */
	@RequestMapping(value="admin/ProductInfo/ProductInfoInsert",method=RequestMethod.POST)
	public String ProductInfoInsert(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName()+"productInfoProductinfoInsertStart");
		
		String msg ="";
		String url ="/admin/ProductInfo/List.do";
		 
		try {
		
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
		 
		 } catch (Exception e) {
			 
			 msg = "등록 실패"+ e.toString();
			 url ="/admin/ProductInfo/List.do";
		
			 log.info(e.toString());
			 e.printStackTrace();
			
		 } finally {
		
			 log.info(this.getClass().getName()+"productInfoProductinfoInsertEnd");
			 
			 model.addAttribute("msg", msg);
			 model.addAttribute("url", url);
			 
		 }
		
		 return "/redirect";
		
	}

	
	
	/* 삭제 Controller */    
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
		
	
	
	/* 수정 Controller */      
	@RequestMapping(value="admin/ProductInfo/ProductInfoUpdateForm",method=RequestMethod.GET)
	public String ProductInfoUpdateForm(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName()+"productInfoProductinfoUpdateStart");

		String prod_no =CmmUtil.nvl(request.getParameter("prod_no1"));
		System.out.println("update prod_no : " + CmmUtil.nvl(request.getParameter("prod_no1")));
		
		ProductInfoDTO productInfoDTO = new ProductInfoDTO();
		productInfoDTO.setProd_no(prod_no);
	
		ProductInfoDTO rDTO = productInfoService.getProductInfoDetail(productInfoDTO);
			
		model.addAttribute("dlwkdus", rDTO);
		
		
	    log.info(this.getClass().getName()+"productInfoProductinfoUpdateEND");
	    
		return "/admin/ProductInfo/ProductInfoUpdate";
		
	}
	
	/* 수정(Update) Controller */
	@RequestMapping(value="admin/ProductInfo/ProductInfoUpdate",method=RequestMethod.POST)
	public String ProductInfoUpdate(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName()+"productInfoProductInfoDelect Start");
		
		 String msg ="";
		 String url ="admin/ProductInfo/ProductInfoDetail.do";
		 
		 try {
		
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
		 
		 } catch(Exception e) {
			 
		 msg = "수정 실패"+ e.toString();
		 url ="/admin/ProductInfo/List.do";
		
			log.info(e.toString());
			e.printStackTrace();
			
		 }
		 finally {
		
		log.info(this.getClass().getName()+"productInfoProductinfoInsertEnd");
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		 }
		 
		return "/redirect";
		
	}
	
	/* 옵션 등록 Controller */ 
	@RequestMapping(value="admin/ProductInfo/ProductInfoOptionReg",method=RequestMethod.GET)
	public String ProductInfoOptionReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		log.info(this.getClass().getName()+"productInfoProductinfoRegStart");
		
		System.out.println("들어");

		log.info(this.getClass().getName()+"productInfoProductinfoRegEnd");
		
		return "/admin/ProductInfo/ProductInfoOption";
		
			}
	
	/* 옵션 등록(Insert) Controller */
	@RequestMapping(value="admin/ProductInfo/ProductInfoOptionInsert",method=RequestMethod.POST)
	public String ProductInfoOptionInsert(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception
			{
		
		
		 log.info(this.getClass().getName()+"productInfoProductinfoInsertStart");
		 String msg ="";
		 String url ="/admin/ProductInfo/ProductReg.do";
		 
		 try{
		
		 ProductInfoOptionDTO rdto = new ProductInfoOptionDTO();
		 
	   
		 String opt_name = CmmUtil.nvl(request.getParameter("opt_name"));
		 System.out.println("OPT_NAME  : " +  CmmUtil.nvl(request.getParameter("prod_name")));
		 
		 String opt_kind =CmmUtil.nvl(request.getParameter("opt_kind"));
		 System.out.println("OPT_PRICE  : " + CmmUtil.nvl(request.getParameter("opt_kind")));
		 
		 String opt_price =CmmUtil.nvl(request.getParameter("opt_price"));
		 System.out.println("OPT_CONTENTS  : " + CmmUtil.nvl(request.getParameter("opt_price")));
		 
	
		 rdto.setOpt_price(opt_name);	
		 rdto.setOpt_kind(opt_kind);
		 rdto.setOpt_price(opt_price);
		 
		 
		 
		 productInfoService.ProductInfoOptionInsert(rdto);
		 
		 
		 
		 msg = "옵션 등록 완료";
		 url ="/admin/ProductInfo/ProductReg.do";
		 
		 rdto= null;
		 
		 } catch(Exception e){
			 
		 msg = "옵션 등록 실패"+ e.toString();
		 url ="/admin/ProductInfo/ProductReg.do";
		
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