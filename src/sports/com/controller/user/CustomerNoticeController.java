package sports.com.controller.user;

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
import sports.com.service.INoticeService;
import sports.com.util.AES256Util;
import sports.com.util.CmmUtil;

@Controller
public class CustomerNoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	@RequestMapping(value="/customer/notice/NoticeList",method=RequestMethod.GET)
	public String noticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /customer/admin_join");
		
		List<NoticeDTO> nList = new ArrayList<NoticeDTO>();
		
		nList = noticeService.getNoticeList();
		
		
		if(nList == null){
			nList = new ArrayList<NoticeDTO>();
		}
		
		for(NoticeDTO nDTO : nList){
		
		String reg_dt = CmmUtil.nvl(nDTO.getReg_dt());//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = transFormat.parse(reg_dt);

		long now = System.currentTimeMillis();
		long inputDate = to.getTime();

		if (now - inputDate < (1000*60*60*24*3)) {
			nDTO.setNew_yn("Y");
			}else{
			nDTO.setNew_yn("");	
			}
		
		String title = CmmUtil.nvl(nDTO.getTitle());//제목이 14자 이상이면 ...붙여주기
		if (title.length() >= 14) {
			title = title.substring(0, 14) + "...";
		}
		
		nDTO.setUser_name(AES256Util.strDecode(CmmUtil.nvl(nDTO.getUser_name())));//암호화된 유저이름 풀기
		
		}
		
		
		
		model.addAttribute("nList",nList);
		
		nList = null;
		
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		return "/customer/notice/NoticeList";
	}
	

	


	@RequestMapping(value="/customer/notice/readMore.do")
	public @ResponseBody List<NoticeDTO> Notice_MoreView(@RequestParam(value = "cnt") String cnt,@RequestParam(value = "search") String search) throws Exception{
		
		NoticeDTO nDTO = new NoticeDTO();
		
		nDTO.setRead_more(cnt);
		System.out.println("넘어온 cnt : " +cnt);
		
		nDTO.setSearch(search);
		System.out.println("넘어온search : " +search);
		
		
		List <NoticeDTO> viewMore_list = noticeService.Notice_MoreView(nDTO);
		
		for(NoticeDTO nDT : viewMore_list){//new 붙히는 시간 계산해서 nList의 title에 new 붙여주기
			String reg_dt = CmmUtil.nvl(nDT.getReg_dt());
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date to = transFormat.parse(reg_dt);

			long now = System.currentTimeMillis();
			long inputDate = to.getTime();

			if (now - inputDate < (1000*60*60*24*3)) {
				nDT.setNew_yn("Y");
					}
			
			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
			
			
			nDT.setUser_name(AES256Util.strDecode(CmmUtil.nvl(nDT.getUser_name())));//암호화된 유저이름 풀기
			
			
			}
		
		System.out.println("겟 리드모어 : " + nDTO.getRead_more());
		
		for(NoticeDTO ndt : viewMore_list ){
			System.out.println( "제목 :"+  ndt.getTitle());
			System.out.println("유저 이름은 :"+ndt.getUser_name());
		}
		
		nDTO= null;
		
		return viewMore_list;
	}
	
	
	@RequestMapping(value="/customer/notice/search")
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

			if (now - inputDate < (1000*60*60*24*3)) {
				nDT.setNew_yn("Y");
					}
			
			String title = CmmUtil.nvl(nDT.getTitle());//제목이 14자 이상이면 ...붙여주기
			if (title.length() >= 14) {
				title = title.substring(0, 14) + "...";
			}
			
			
			nDT.setUser_name(AES256Util.strDecode(CmmUtil.nvl(nDT.getUser_name())));//암호화된 유저이름 풀기
			}
		
		for(NoticeDTO n : ndTO){
			System.out.println(n.getTitle());
		}
		
				
		
		return ndTO;
		
	}
	
	@RequestMapping(value="/customer/notice/NoticeInfo",method={RequestMethod.GET, RequestMethod.POST})
	public String noticeInfo(HttpServletRequest request, ModelMap model) throws Exception{
		log.info("welcome /customer/NoticeInfo");
		
		String notice_no = request.getParameter("notice_no");
		
		NoticeDTO nDTO = new NoticeDTO();
		nDTO.setNotice_no(notice_no);
		
		NoticeDTO rDTO = noticeService.getNoticeDetailInfo(nDTO);
		
		rDTO.setUser_name(AES256Util.strDecode(CmmUtil.nvl(rDTO.getUser_name())));//암호화된 유저이름 풀기
		
		model.addAttribute("rDTO",rDTO);
		
		nDTO = null;
		
		log.info(this.getClass().getName() + ".NoticeInfo end!");
		
		return "/customer/notice/NoticeInfo";
	}
	
	
}

