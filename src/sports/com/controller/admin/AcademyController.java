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

import sports.com.dto.AcademyDTO;
import sports.com.service.IAcademyService;
import sports.com.service.impl.AcademyService;
import sports.com.util.CmmUtil;

@Controller
public class AcademyController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AcademyService")
	private IAcademyService academyService;

	@RequestMapping("acamap")
	public String adminacmap(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "학원 컨트롤러 start!");

		List<AcademyDTO> list = academyService.getAcaList();
		log.info("리스트 사이즈 "+list.size());
		for(int i=0; i>list.size()-1; i++){
		log.info("리스트 인덱스 i"+list.get(i));
		}
		model.addAttribute("list", list);

		System.out.println("ac 컨트롤러 end");
		return "/admin/Academy/AcaMap";

	}
	@RequestMapping("accountmanagement")
	public String Accmanag(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		//로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + "거래처관리 컨트롤러 start!");

		// 리스트 가져오기

		List<AcademyDTO> rlist = academyService.getAccountList();
		
		
		
		if (rlist==null){
			rlist = new ArrayList<AcademyDTO>();
		}
		log.info("111rlist 사이즈는 글 개수 "+rlist.size());

		log.info("rlist 비어있냐 "+ rlist.isEmpty());
		//조회된 리스트 결과값 넣어주기
		log.info("222리스트 사이즈 "+rlist.size());
		model.addAttribute("rlist", rlist);
		
		
		log.info("rlist " + rlist.get(0).getAca_area1());
		log.info("rlist " + rlist.get(0).getAca_area2());
		log.info("rlist " + rlist.get(0).getAca_no());
		log.info("rlist " + rlist.get(0).getAca_name());
		//변수 초기화(메모리 효율화 시키기 위해 사용함)
		rlist = null; 
		
		//로그 찍기(추후 찍은 로그를 통해 이 함수 호출이 끝났는지 파악하기 용이하다.)
		log.info(this.getClass().getName() + "거래처관리 리스트 end!");

		System.out.println("acc 컨트롤러 end");
		
		
		//로직 끝나고 보여줄 JSP파일
		return "/admin/Academy/AccountManagement";
	}
	
	@RequestMapping("accountreg")
	public String accountReg(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("거래처 등록 컨트롤러 ");

		return "/admin/Academy/AccountInsert";
		
	}
	
	@RequestMapping(value="accountinsert", method=RequestMethod.POST)
	public String NoticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".accountInsert start!");
		
		String msg = "";
		
		try{
			/*
			 * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
			 * */
			String aca_no = CmmUtil.nvl(request.getParameter("aca_no")); 
			String aca_name = CmmUtil.nvl(request.getParameter("aca_name")); 
			String aca_area1 = CmmUtil.nvl(request.getParameter("aca_area1")); 
			String aca_area2 = CmmUtil.nvl(request.getParameter("aca_area2")); 
	
			/*
			 * #######################################################
			 * 	 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함
			 * 						반드시 작성할 것
			 * #######################################################
			 * */
			AcademyDTO aDTO = new AcademyDTO();
			
			aDTO.setAca_no(aca_no); 
			aDTO.setAca_name(aca_name);
			aDTO.setAca_area1(aca_area1);
			aDTO.setAca_area2(aca_area2);
	
			log.info("aca_no : "+ aca_no);
			log.info("aca_name : "+ aca_name);
			log.info("aca_area1 : "+ aca_area1);
			log.info("aca_area1 : "+ aca_area2);		
			
			
			/*
			 * 게시글 등록하기위한 비즈니스 로직을 호출
			 * */
			academyService.AccountInsert(aDTO);

			
			//저장이 완료되면 사용자에게 보여줄 메시지
			msg = "등록되었습니다.";
			
			
			//변수 초기화(메모리 효율화 시키기 위해 사용함)
			aDTO = null;
			
		}catch(Exception e){
			
			//저장이 실패되면 사용자에게 보여줄 메시지			
			msg = "실패하였습니다 : "+ e.toString();
			log.info(e.toString());
			e.printStackTrace();
			
		}finally{
			log.info(this.getClass().getName() + ".AcInsert end!");
			
			//결과 메시지 전달하기
			model.addAttribute("msg", msg);
			
		}
		
		return "/admin/Academy/AccountMsg";
	}	
	
	@RequestMapping(value="/accountinfo", method=RequestMethod.GET)
	public String NoticeInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + "거래처 상세 start!");
		

		/*
		 * 게시판 글 등록되기 위해 사용되는 form객체의 하위 input 객체 등을 받아오기 위해 사용함
		 * */
		String aca_no = CmmUtil.nvl(request.getParameter("aca_no")); //공지글번호(PK)
		
		
		/*
		 * #######################################################
		 * 	 반드시, 값을 받았으면, 꼭 로그를 찍어서 값이 제대로 들어오는지 파악해야함
		 * 						반드시 작성할 것
		 * #######################################################
		 * */
		log.info("aca_no : "+ aca_no);
		
		
		/*
		 * 값 전달은 반드시 DTO 객체를 이용해서 처리함
		 * 전달 받은 값을 DTO 객체에 넣는다.
		 * */		
		AcademyDTO aDTO = new AcademyDTO();

		
		aDTO.setAca_no(aca_no);	
		
		//공지사항 글 조회수 증가
		/* noticeService.updateNoticeReadCnt(aDTO);
		
		log.info("read_cnt update success!!!");*/
		
		//공지사항 상세정보 가져오기
		AcademyDTO rDTO = academyService.getAccountInfo(aDTO);
		
		log.info("아카넘버 본다" + rDTO.getAca_no());
		
		if (rDTO==null){
			rDTO = new AcademyDTO();
			
		}
		
		log.info("getAccountInfo success!!!");
		
		//조회된 리스트 결과값 넣어주기
		model.addAttribute("rDTO", rDTO);
		
		log.info("rDTO 다 본다"+rDTO.getAca_area1());
		
		//변수 초기화(메모리 효율화 시키기 위해 사용함)
		rDTO = null;
		aDTO = null;
		
		log.info(this.getClass().getName() + ".AccountInfo end!");
		
		return "/admin/Academy/AccountInfo";
	}
	
	
}
