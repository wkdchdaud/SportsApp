package sports.com.controller.user;

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
public class CustomerQAController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "QAService") 
	private IQAService qaService;
	
	@RequestMapping(value="customer/QA/QAList", method=RequestMethod.GET)
	public String QAList(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAList start!");

		List<QADTO> rList = qaService.getQAList();
		
		if (rList==null) {
			rList = new ArrayList<QADTO>();
		}
		
		model.addAttribute("rList", rList);
		
		rList = null;
		
		log.info(this.getClass().getName() + ".QAList end!");
		
		return "/customer/QA/QAList";
		
	}
	
	@RequestMapping(value="customer/QA/QAReg", method=RequestMethod.GET)
	public String QAReg(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAReg start!");
		
		log.info(this.getClass().getName() + ".QAReg end!");
		
		return "/customer/QA/QAReg";
		
	}
	
	@RequestMapping(value="customer/QA/QAInsert", method=RequestMethod.POST)
	public String QAInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAInsert start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String reg_user_no = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn"));
			String title = CmmUtil.nvl(request.getParameter("title"));
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n", "<br>");
			
			log.info("reg_user_no: " + reg_user_no);
			log.info("secret_yn: " + secret_yn);
			log.info("title: " + title);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setReg_user_no(reg_user_no);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setTitle(title);
			qaDTO.setContents(contents);
	
			qaService.insertQADetail(qaDTO);

			msg = "게시글 등록에 성공하였습니다.";
			url = "/customer/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
					
			msg = "게시글 등록에 실패하였습니다." + e.toString();
			url = "/customer/QA/QAList.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAInsert end!");

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="customer/QA/QADetail", method=RequestMethod.GET)
	public String QADetail(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADetail start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));

		log.info("qa_no: " + qa_no);
		
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
		
		return "/customer/QA/QADetail";
		
	}
	
	@RequestMapping(value="customer/QA/QAEdit", method=RequestMethod.GET)
	public String QAEdit(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAEdit start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
		String q_no = CmmUtil.nvl(request.getParameter("q_no"));
		
		log.info("qa_no: "+ qa_no);
		log.info("q_no: "+ q_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		qaDTO.setQ_no(q_no);
		
		QADTO rDTO = qaService.getQADetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();	
		}
		
		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAEdit end!");
		
		return "/customer/QA/QAEdit";
		
	}
	
	@RequestMapping(value="customer/QA/QAUpdate", method=RequestMethod.POST)
	public String QAUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAUpdate start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String reg_user_no = CmmUtil.nvl((String)session.getAttribute("SESSION_USER_NO")); 
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));
			String q_no = CmmUtil.nvl(request.getParameter("q_no"));
			String answer_yn = CmmUtil.nvl(request.getParameter("answer_yn"));
			String secret_yn = CmmUtil.nvl(request.getParameter("secret_yn")); 
			String title = CmmUtil.nvl(request.getParameter("title")); 
			String contents = CmmUtil.nvl(request.getParameter("contents"));
			
			contents = contents.replace("\r\n", "<br>");
			
			log.info("reg_user_no: " + reg_user_no);
			log.info("qa_no: " + qa_no);
			log.info("q_no: " + q_no);
			log.info("answer_yn: " + answer_yn);
			log.info("secret_yn: " + secret_yn);
			log.info("title: " + title);
			log.info("contents: " + contents);		
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setReg_user_no(reg_user_no);
			qaDTO.setQa_no(qa_no);
			qaDTO.setQ_no(q_no);
			qaDTO.setAnswer_yn(answer_yn);
			qaDTO.setSecret_yn(secret_yn);
			qaDTO.setTitle(title);
			qaDTO.setContents(contents);
	
			qaService.updateQADetail(qaDTO);
			
			msg = "게시글 수정에 성공하였습니다.";
			url = "/customer/QA/QADetail.do?qa_no=" + qa_no;
			
			qaDTO = null;
			
		} catch(Exception e) {
			
			String qa_no = CmmUtil.nvl(request.getParameter("qa_no")); 
			
			msg = "게시글 수정에 실패하였습니다."+ e.toString();
			url = "/customer/QA/QADetail.do?qa_no=" + qa_no;
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QAUpdate end!");
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="customer/QA/QADelete", method=RequestMethod.GET)
	public String QADelete(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QADelete start!");
		
		String msg = "";
		String url = "";
		
		try {
			
			String q_no = CmmUtil.nvl(request.getParameter("q_no"));
			
			log.info("q_no: "+ q_no);
			
			QADTO qaDTO = new QADTO();
			
			qaDTO.setQ_no(q_no);
			
			qaService.deleteQADetail(qaDTO);
			
			msg = "게시글 삭제에 성공하였습니다.";
			url = "/customer/QA/QAList.do";
			
			qaDTO = null;
			
		} catch (Exception e) {
			
			msg = "게시글 삭제에 실패하였습니다."+ e.toString();
			url = "/customer/QA/QADetail.do";
			
			log.info(e.toString());
			e.printStackTrace();
			
		} finally {
			
			log.info(this.getClass().getName() + ".QADelete end!");
		
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			
		}
		
		return "/redirect";
		
	}	
	
	@RequestMapping(value="customer/QA/QAAnswerDetail", method=RequestMethod.GET)
	public String QAAnswerDetail(HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".QAAnswerDetail start!");
		
		String qa_no = CmmUtil.nvl(request.getParameter("qa_no"));

		log.info("qa_no: " + qa_no);
		
		QADTO qaDTO = new QADTO();
		
		qaDTO.setQa_no(qa_no);
		
		QADTO rDTO = qaService.getQAAnswerDetail(qaDTO);
		
		if (rDTO==null) {
			rDTO = new QADTO();
		}
		
		log.info("getQAAnswerDetail success!");

		model.addAttribute("rDTO", rDTO);
		
		rDTO = null;
		qaDTO = null;
		
		log.info(this.getClass().getName() + ".QAAnswerDetail end!");
		
		return "/customer/QA/QAAnswerDetail";
		
	}

}