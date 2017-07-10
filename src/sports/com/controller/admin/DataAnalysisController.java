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

import sports.com.dto.UserDTO;
import sports.com.service.IAnalysisService;
import sports.com.service.IUserService;
import sports.com.util.CmmUtil;
import sports.com.util.RUtil;
import sports.com.dto.R_testDTO;

import java.util.List;

@Controller
public class DataAnalysisController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="AnalysisService")
	private IAnalysisService analysisService;
	
	
	@RequestMapping(value="sales/List" , method=RequestMethod.GET)
	public String sales_Info(HttpSession session, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception{
		System.out.println("로그인포 시작 : ");
		log.info(Logger.getLogger(this.toString()));
		
		List<R_testDTO> sales_list = analysisService.getSalesInfo();
		
		model.addAttribute("sales_list", sales_list);
		
		System.out.println("로그인포 끝 !!!!");
		
		
		return "/admin/Analysis/saleList";
		
		
	}
	
	@RequestMapping(value="/admin/Analysis/AnalysisList",method=RequestMethod.GET)
	public String relation_Info(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
	{
		log.info("R PromGramming Start!");
		
		List<R_testDTO> R_list = analysisService.getAnalysisList();
//		System.out.println("R_list.get(0): "+ R_list.get(0).getPrice());
		RUtil LJYheartbit = new RUtil();
		
		double qwe = LJYheartbit.R_list(R_list);
		
		System.out.println("R Apriori 알고리즘 으로 나온 값 :::: " +qwe); 
		
		model.addAttribute("R_test",R_list);
		
		
		return "asd";
	}
	
	
}
