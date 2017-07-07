package sports.com.controller.admin;

import java.util.List;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.dto.QADTO;
import sports.com.service.IQAService;
import sports.com.util.CmmUtil;

@Controller

public class QAController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "QAService") 
	private IQAService qaService;
	
	@RequestMapping(value="admin/QA/QAList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAList start!");

		List<QADTO> rList = qaService.getQAList();
		
		if (rList==null) {
			rList = new ArrayList<QADTO>();
		}
		
		model.addAttribute("rList", rList);
		
		rList = null;
		
		log.info(this.getClass().getName() + ".QAList end!");
		
		return "/admin/QA/QAList";
		
	}
	
	@RequestMapping(value="admin/QA/QAReg", method=RequestMethod.GET)
	public String NoticeReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAReg start!");
		
		log.info(this.getClass().getName() + ".QAReg end!");
		
		return "/admin/QA/QAReg";
		
	}
	
	@RequestMapping(value="admin/QA/QAInsert", method=RequestMethod.POST)
	public String NoticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAInsert start!");
		
		String msg = "";
		String url = "/admin/QA/QAList.do";
		
		try {
			
			String user_no = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO"));
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			String title = CmmUtil.nvl(request.getParameter("title"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn"));
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n","<br>");
			
			log.info("user_no: " + user_no);
			log.info("qa_no: " + qa_no);
			log.info("title: " + title);
			log.info("secret_yn: " + secret_yn);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setUser_no(user_no);
			qaDTO.setQa_no(qa_no);
			qaDTO.setTitle(title);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setContents(contents);
	
			qaService.insertQADetail(qaDTO);

			msg = "게시글 등록에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
					
			msg = "게시글 등록에 실패하였습니다." + e.toString();
			url = "/admin/QA/QAList.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAInsert end!");

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="admin/QA/QADetail", method=RequestMethod.GET)
	public String NoticeInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADetail start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));

		log.info("qa_no: "+ qa_no);
	
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);		
		
		QADTO rDTO = qaService.getQADetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();
		}
		
		log.info("getQADetail success!");

		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QADetail end!");
		
		return "/admin/QA/QADetail";
	}
	
	@RequestMapping(value="admin/QA/QAEdit", method=RequestMethod.GET)
	public String NoticeEditInfo(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAEdit start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
		
		log.info("qa_no: "+ qa_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);	
		
		QADTO rDTO = qaService.getQADetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();	
		}
		
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAEdit end!");
		
		return "/admin/QA/QAEdit";
		
	}
	
	@RequestMapping(value="admin/QA/QAUpdate", method=RequestMethod.POST)
	public String NoticeUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAUpdate start!");
		
		String msg = "";
		String url = "/admin/QA/QADetail.do";
		
		try {
			
			String user_no = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO")); 
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no")); 
			String title = CmmUtil.nvl(request.getParameter("title")); 
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn")); 
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n","<br>");
	
			log.info("user_no: "+ user_no);
			log.info("qa_no: "+ qa_no);
			log.info("title: "+ title);
			log.info("secret_yn: "+ secret_yn);
			log.info("contents: "+ contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setUser_no(user_no);
			qaDTO.setQa_no(qa_no);
			qaDTO.setTitle(title);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setContents(contents);
	
			qaService.updateQADetail(qaDTO);
			
			msg = "게시글 수정에 성공하였습니다.";
			url = "/admin/QA/QADetail.do";
			
			qaDTO = null;
			
		} catch(Exception e) {
			
			msg = "게시글 수정에 실패하였습니다."+ e.toString();
			url = "/admin/QA/QADetail.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAUpdate end!");
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="admin/QA/QADelete", method=RequestMethod.GET)
	public String NoticeDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADelete start!");
		
		String msg = "";
		String url = "/admin/QA/QAList.do";
		
		try {
			
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			
			log.info("qa_no: "+ qa_no);
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setQa_no(qa_no);
			
			qaService.deleteQADetail(qaDTO);
			
			msg = "게시글 삭제에 성공하였습니다.";
			url = "/admin/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
			
			msg = "게시글 삭제에 실패하였습니다."+ e.toString();
			url = "/admin/QA/QADetail.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QADelete end!");
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
}