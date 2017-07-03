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

import sports.com.dto.NoticeDTO;
import sports.com.service.INoticeService;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService userService;
	
	@RequestMapping(value="/admin/notice/NoticeList",method=RequestMethod.GET)
	public String noticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_join");
		List<NoticeDTO> rList = userService.getNoticeList();
		
		if (rList == null){
			rList = new ArrayList<NoticeDTO>();
		}
		
		model.addAttribute("rList",rList);
		
		rList = null;
		
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		return "/user/notice/NoticeList";
	}
	
	@RequestMapping(value="/admin/notice/NoticeReg",method=RequestMethod.POST)
	public String noticeReg(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		
		log.info(this.getClass().getName() + ".NoticeReg start!");
		
		log.info(this.getClass().getName() + ".NoticeReg end!");
		
		
		return "/user/notice/NoticeReg";
	}
	
	@RequestMapping(value="/admin/notice/NoticeInsert",method=RequestMethod.GET)
	public String noticeInsert(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/NoticeInsert");
		
		return "/user/notice/NoticeInsert";
	}
	
	@RequestMapping(value="/admin/notice/NoticeInfo",method=RequestMethod.GET)
	public String noticeInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/NoticeInfo");
		return "/user/notice/NoticeInfo";
	}
	
	@RequestMapping(value="/admin/notice/NoticeEditInfo",method=RequestMethod.GET)
	public String noticeEditInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/NoticeEditInfo");
		return "/user/notice/NoticeEditInfo";
	}
	
	@RequestMapping(value="/admin/notice/NoticeUpdate",method=RequestMethod.GET)
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/NoticeUpdate");
		return "/user/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/NoticeDelete",method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/NoticeDelete");
		return "/user/notice/redirect";
	}
	
}

