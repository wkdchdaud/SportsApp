package sports.com.controller.admin;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sports.com.dto.NoticeDTO;
import sports.com.dto.ProductInfoDTO;
import sports.com.service.INoticeService;
import sports.com.util.CmmUtil;

@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping(value="/admin/notice/NoticeList",method=RequestMethod.GET)
	public String noticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/admin_join");
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();
		
		nList = noticeService.getNoticeList();
		
		if(nList == null){
			nList = new ArrayList<NoticeDTO>();
		}
		
		model.addAttribute("nList",nList);
		
		nList = null;
		
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		return "/admin/notice/NoticeList";
	}
	
	@RequestMapping(value="/admin/notice/NoticeReg",method=RequestMethod.GET)
	public String noticeReg(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		
		log.info(this.getClass().getName() + ".NoticeReg start!");
		
		
		
		log.info(this.getClass().getName() + ".NoticeReg end!");
		
		return "/admin/notice/NoticeReg";
		
	}
	
	@RequestMapping(value="/admin/notice/NoticeInsert",method=RequestMethod.POST)
	public String noticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeInsert");
		
		String user_no = "123";
		String title = CmmUtil.nvl(request.getParameter("title"));
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		String notice_yn = CmmUtil.nvl(request.getParameter("notice_yn"));
		
		contents = contents.replace("\r\n","<br>");
		
		log.info("user_no : "+ user_no);
		log.info("title : "+ title);
		log.info("noticeYn : "+ notice_yn);
		log.info("contents : "+ contents);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setCONTENTS(contents);
		noticeDTO.setTITLE(title);
		noticeDTO.setUSER_NO(user_no);
		noticeDTO.setNOTICE_YN(notice_yn);
		
		noticeService.InsertNoticeInfo(noticeDTO);
		
		model.addAttribute("msg","등록완료");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/NoticeInfo",method={RequestMethod.GET, RequestMethod.POST})
	public String noticeInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNOTICE_NO(notice_no);
		
		List<NoticeDTO> nList = noticeService.getNoticeDetailInfo(nDTO);
		
		model.addAttribute("nList",nList);
		
		
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/admin/notice/NoticeInfo";
	}
	
	@RequestMapping(value="/admin/notice/NoticeEditInfo",method=RequestMethod.GET)
	public String noticeEditInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeEditInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNOTICE_NO(notice_no);
		
		List<NoticeDTO> nList = noticeService.getNoticeDetailInfo(nDTO);
		
		model.addAttribute("nList",nList);

		return "/admin/notice/NoticeEditInfo";
	}
	
	@RequestMapping(value="/admin/notice/NoticeUpdate",method=RequestMethod.POST)
	public String noticeUpdate(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeUpdate");
		
		String notice_no = CmmUtil.nvl(request.getParameter("notice_no"));
		String title = CmmUtil.nvl(request.getParameter("title"));
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		
		String notice_yn = CmmUtil.nvl(request.getParameter("notice_yn"));
		
		contents = contents.replace("\r\n","<br>");
		
		log.info("notice_no : "+ notice_no);
		log.info("title : "+ title);
		log.info("noticeYn : "+ notice_yn);
		log.info("contents : "+ contents);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setCONTENTS(contents);
		noticeDTO.setTITLE(title);
		noticeDTO.setNOTICE_YN(notice_yn);
		noticeDTO.setNOTICE_NO(notice_no);
		
		noticeService.updateNoticeInfo(noticeDTO);
		
		model.addAttribute("msg","수정완료");
		model.addAttribute("url","/admin/notice/NoticeInfo.do?notice_no="+notice_no);
		
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/NoticeDelete",method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeDelete");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNOTICE_NO(notice_no);
		
		noticeService.deleteNoticeInfo(nDTO);
		
		model.addAttribute("msg","삭제완료");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	
	@RequestMapping(value="/admin/notice/NoticeCheckboxDelete",method=RequestMethod.POST)
	public String NoticeCheckboxDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeCheckboxDelete");
		//aa
		String[] deleteSelect = request.getParameterValues("deleteSelect");
		
		NoticeDTO nDTO = new NoticeDTO();
		
		for(int i =0; i<deleteSelect.length;i++){
		
			nDTO.setNOTICE_NO(deleteSelect[i]);
		
			noticeService.deleteNoticeInfo(nDTO);
	
		}
		
		model.addAttribute("msg","삭제완료");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/readMore.do")
	public @ResponseBody List<NoticeDTO> Notice_MoreView(@RequestParam(value = "cnt") String cnt) throws Exception{
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setRead_more(cnt);
		System.out.println("넘어온 cnt : " +cnt);
		List <NoticeDTO> viewMore_list = noticeService.Notice_MoreView(nDTO);
		
		System.out.println("겟 리드모어 : " + nDTO.getRead_more());
		
		for(NoticeDTO ndt : viewMore_list ){
			System.out.println( "제목 :"+  ndt.getTITLE());
		}
		
		nDTO= null;
		
		return viewMore_list;
	}
}

