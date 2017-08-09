package sports.com.controller.user;

import java.util.ArrayList;
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

import sports.com.dto.NoticeDTO;
import sports.com.service.INoticeService;
import sports.com.util.CmmUtil;

@Controller
public class CustomerNoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping(value="/customer/notice/NoticeList",method=RequestMethod.GET)
	public String noticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /customer/user_join");
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();
		
		nList = noticeService.getNoticeList();
		
		if(nList == null){
			nList = new ArrayList<NoticeDTO>();
		}
		
		model.addAttribute("nList",nList);
		
		nList = null;
		
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		return "/customer/notice/NoticeList";
	}
	

	

	
	@RequestMapping(value="/customer/notice/NoticeInfo",method={RequestMethod.GET, RequestMethod.POST})
	public String noticeInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /customer/NoticeInfo");
		
		String notice_no = CmmUtil.nvl(request.getParameter("notice_no"));
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		NoticeDTO nList = noticeService.getNoticeDetailInfo(nDTO);
		
		model.addAttribute("nList",nList);
		
		
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/customer/notice/NoticeInfo";
	}
	
	
	

	
}

