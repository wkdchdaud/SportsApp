package sports.com.controller.admin;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		
		for(NoticeDTO nDTO : nList){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
		String reg_dt = CmmUtil.nvl(nDTO.getReg_dt());
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = transFormat.parse(reg_dt);

		long now = System.currentTimeMillis();
		long inputDate = to.getTime();

		String title = CmmUtil.nvl(nDTO.getTitle());//제목이 14자 이상이면 ...붙여주기
		if (title.length() >= 14) {
			title = title.substring(0, 14) + "...";
		}
		if (now - inputDate < (1000*60*60*24*3)) {
		nDTO.setTitle(title+"<b>[NEW]</b>");
			}
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
		
		String user_no = (String)request.getSession().getAttribute("user_no");
		String title = CmmUtil.nvl(request.getParameter("title"));
		String contents = CmmUtil.nvl(request.getParameter("contents"));
		String notice_yn = CmmUtil.nvl(request.getParameter("notice_yn"));
		
		contents = contents.replace("\r\n","<br>");
		
		
		log.info("user_no : "+ user_no);
		log.info("title : "+ title);
		log.info("noticeYn : "+ notice_yn);
		log.info("contents : "+ contents);
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setContents(contents);
		noticeDTO.setTitle(title);
		noticeDTO.setUser_no(user_no);
		noticeDTO.setNotice_yn(notice_yn);
		
		noticeService.InsertNoticeInfo(noticeDTO);
		
		noticeDTO = null;
		
		model.addAttribute("msg","게시글 등록에 성공하였습니다.");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/NoticeInfo",method={RequestMethod.GET, RequestMethod.POST})
	public String noticeInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		List<NoticeDTO> nList = noticeService.getNoticeDetailInfo(nDTO);
		
		model.addAttribute("nList",nList);
		
		nDTO = null;
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/admin/notice/NoticeInfo";
	}
	
	@RequestMapping(value="/admin/notice/NoticeEditInfo",method=RequestMethod.GET)
	public String noticeEditInfo(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeEditInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		List<NoticeDTO> nList = noticeService.getNoticeDetailInfo(nDTO);
		
		nDTO = null;
		
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
		noticeDTO.setContents(contents);
		noticeDTO.setTitle(title);
		noticeDTO.setNotice_no(notice_no);
		noticeDTO.setNotice_yn(notice_yn);
		
		noticeService.updateNoticeInfo(noticeDTO);
		
		model.addAttribute("msg","게시글 수정에 성공하였습니다.");
		model.addAttribute("url","/admin/notice/NoticeInfo.do?notice_no="+notice_no);
		
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/NoticeDelete",method=RequestMethod.GET)
	public String noticeDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeDelete");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		noticeService.deleteNoticeInfo(nDTO);
		
		model.addAttribute("msg","게시글 삭제에 성공하였습니다.");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	
	@RequestMapping(value="/admin/notice/NoticeCheckboxDelete",method=RequestMethod.POST)
	public String NoticeCheckboxDelete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/NoticeCheckboxDelete");

		String[] deleteSelect = request.getParameterValues("deleteSelect");
		
		NoticeDTO nDTO = new NoticeDTO();
		
		
			nDTO.setAllCheckSeq(deleteSelect);
		
			noticeService.deleteCheckList(nDTO);
		
		model.addAttribute("msg","선택된 게시글 삭제에 성공하였습니다.");
		model.addAttribute("url","/admin/notice/NoticeList.do");
		
		return "/admin/notice/redirect";
	}
	
	@RequestMapping(value="/admin/notice/readMore.do")
	public @ResponseBody List<NoticeDTO> Notice_MoreView(@RequestParam(value = "cnt") String cnt) throws Exception{
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setRead_more(cnt);
		System.out.println("넘어온 cnt : " +cnt);
		
		
		List <NoticeDTO> viewMore_list = noticeService.Notice_MoreView(nDTO);
		
		for(NoticeDTO nDT : viewMore_list){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
			String reg_dt = CmmUtil.nvl(nDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
			if (now - inputDate < (1000*60*60*24*3)) {
			nDT.setTitle(title+"<b>[NEW]</b>");
				}
			}
		
		System.out.println("겟 리드모어 : " + nDTO.getRead_more());
		
		for(NoticeDTO ndt : viewMore_list ){
			System.out.println( "제목 :"+  ndt.getTitle());
		}
		
		nDTO= null;
		
		return viewMore_list;
	}
	
	
	@RequestMapping(value="/admin/notice/search")
	public @ResponseBody List<NoticeDTO> searchNoticeList(@RequestParam(value="search") String search) throws Exception{
		
		System.out.println("search : " + search);
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setSearch(search);
		
		List<NoticeDTO> ndTO = noticeService.searchNoticeList(nDTO);
		
		for(NoticeDTO nDT : ndTO){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
			String reg_dt = CmmUtil.nvl(nDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
			if (now - inputDate < (1000*60*60*24*3)) {
			nDT.setTitle(title+"<b>[NEW]</b>");
				}
			}
		
		for(NoticeDTO n : ndTO){
			System.out.println(n.getTitle());
		}
		
				
		
		return ndTO;
		
	}
}


