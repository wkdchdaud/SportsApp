package sports.com.controller.user;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.dto.TestDTO;
import sports.com.service.IComService;

@Controller
public class CustomerComController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "ComService")
	private IComService comService;
	
	@RequestMapping(value="main",method=RequestMethod.GET)
	public String busimain(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/main";
	}
	
	@RequestMapping(value="main2",method=RequestMethod.GET)
	public String busimain2(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain2");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/main2";
	}
	
	@RequestMapping(value="ui",method=RequestMethod.GET)
	public String Ui(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/ui";
	}
	
	@RequestMapping(value="ui1",method=RequestMethod.GET)
	public String Ui1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/ui1";
	}
	
	@RequestMapping(value="table",method=RequestMethod.GET)
	public String Table(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/table";
	}
	
	@RequestMapping(value="accountmanagement2",method=RequestMethod.GET)
	public String account(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/accountmanagement2";
	}
	
	@RequestMapping(value="table1",method=RequestMethod.GET)
	public String table1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/table1";
	}
	
	@RequestMapping(value="chart1",method=RequestMethod.GET)
	public String chart1(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/chart1";
	}
	@RequestMapping(value="chart2",method=RequestMethod.GET)
	public String chart2(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/chart2";
	}
}
