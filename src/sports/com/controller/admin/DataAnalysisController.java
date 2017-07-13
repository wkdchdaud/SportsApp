package sports.com.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sports.com.dto.UserDTO;
import sports.com.service.IAnalysisService;
import sports.com.service.IUserService;
import sports.com.util.CmmUtil;
import sports.com.util.RUtil;
import sports.com.dto.R_testDTO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class DataAnalysisController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="AnalysisService")
	private IAnalysisService analysisService;
	
	
	/*매출 분석 정보 시작*/
	@RequestMapping(value="sales/List" , method=RequestMethod.GET)
	public String sales_Info(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception{
		System.out.println("로그인포 시작 : ");
		log.info(Logger.getLogger(this.toString()));
		
		//Map<String, Object> sales_list = analysisService.getSalesInfo();
		/*맵 처리 해주자 형변환 하라는데 무슨소릴까 서비스랑도 다봐야 할지도*/
		//model.addAttribute("sales_list", sales_list);
		
		//매출 분석 정보 처음 모리스 js 값 오늘 날짜
		List<R_testDTO> sList = analysisService.getSalesInfo();
		//매출분석 정보 처음 매출 순위 정보 테이블 오늘 날짜 디폴트 
		List<R_testDTO> rList = analysisService.getSaleRank();
		
		if(rList == null){
			rList = new ArrayList<R_testDTO>();
		}
		
		if(sList == null){
			sList = new ArrayList<R_testDTO>();
		}
		
		model.addAttribute("sales_list", sList);
		model.addAttribute("rank_list", rList);
		
		rList = null;
		sList = null;
		
		System.out.println("로그인포 끝 !!!!");
		
		return "/admin/Analysis/saleList";
	}

	/*매출 분석 정보 모리스js 차트 값 아작스 구현 */
	@RequestMapping(value="sales/sale_chart")
	public @ResponseBody List<R_testDTO> sale_chart(@RequestParam(value= "sale_date_mo") String day_date, @RequestParam(value="cal_day") String cal_day) throws Exception
	{
		System.out.println("day_date : " + day_date);
		System.out.println("cal_day : " + cal_day);
		
		R_testDTO rdto= new R_testDTO();
		rdto.setSale_date(day_date);
		rdto.setCal_day(cal_day);
		
		log.info("겟 세일데이트  :" + rdto.getSale_date());
		log.info("겟 cal_day  :" + rdto.getCal_day());
		
		List<R_testDTO> sList = analysisService.sale_chart(rdto);

		rdto=null;
		
		return sList;
	}
	
	//매출 분석 정보 매출 순위 정보 테이블로 아작스 구현
	@RequestMapping(value="sales/sale_table")
	public @ResponseBody List<R_testDTO> sale_table(@RequestParam(value="sale_date_mo") String day_date) throws Exception
	{
		log.info("day_date : " + day_date);
		
		R_testDTO rdto = new R_testDTO();
		
		rdto.setSale_date(day_date);
		
		List<R_testDTO> tlist = analysisService.sale_table(rdto);
		
		log.info("sale_table (세일데이트): "+rdto.getSale_date());
		
		rdto=null;
		
		return tlist;
	}
	
/*	Json으로 데이터 받기 예제
	@RequestMapping(value = "rTest")
	public @ResponseBody List<R_testDTO> rtest() throws Exception{
		List<R_testDTO> rList = analysisService.getSaleRank();

		return rList;
	}
		
	/*연관성 분석 시작
	 * 고객이 구매완료한물품에 대하여 리스트를 불러오고
	 * 그거를 R util에 가져가서 rUtil 에서 aruels를 활용하여 적용하고
	 * 그결과값을 내보내는 거지 */ 
	
	@RequestMapping(value="/admin/Analysis/AnalysisList",method=RequestMethod.GET)
	public String relation_Info(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
	{
		log.info("R PromGramming Start!");
//		연관성분석 
		List<R_testDTO> R_list = analysisService.getAnalysisList();
//		System.out.println("R_list.get(0): "+ R_list.get(0).getPrice());
		RUtil auels_util = new RUtil();
		
		double qwe = auels_util.R_list(R_list);
		
		System.out.println("R Apriori 알고리즘 으로 나온 값 :::: " +qwe); 
		
		model.addAttribute("R_test",R_list);
		
		
		return "asd";
	}
	
	
}
