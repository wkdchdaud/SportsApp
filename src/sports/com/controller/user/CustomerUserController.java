package sports.com.controller.user;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.dto.UserDTO;
import sports.com.service.IUserService;
import sports.com.util.CmmUtil;
import sports.com.util.MailUtil;
import sports.com.util.SHAUtill;

@Controller
public class CustomerUserController {
private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	@RequestMapping(value="/user/user_join",method=RequestMethod.GET)
	public String user_join(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_join");
		return "/user/user_join";
	}
	
	@RequestMapping(value="/user/join_proc",method=RequestMethod.POST)
	public String join_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/join_proc start");
		UserDTO userDTO = new UserDTO();
		
		userDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		userDTO.setPassword(SHAUtill.double_encryption(CmmUtil.nvl(request.getParameter("pwd"))));
		userDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setTel(CmmUtil.nvl(request.getParameter("tel")));
		
		log.info("email : " + userDTO.getEmail());
		
		UserDTO uDTO = userService.join_proc(userDTO);
		
		String subject = "회원가입을 축하합니다.";
		String body = "http://localhost:8080/user/user_ck.do?uNo="+CmmUtil.nvl(uDTO.getUser_no());
		
		MailUtil.sendMail(CmmUtil.nvl(request.getParameter("email")), subject, body);
		
		model.addAttribute("msg1", "회원가입 성공하였습니다.");
		model.addAttribute("msg2", "이메일 인증을 완료해주세요.");
		model.addAttribute("url", "/main.do");
		
		
		userDTO = null;
		subject = null;
		body = null;
		
		log.info("welcome /user/join_proc end");
		return "/redirect2";
	}
	
	@RequestMapping(value="/user/user_login",method=RequestMethod.GET)
	public String user_login_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_login_form start");
		return "/user/user_login";
	}
	
	@RequestMapping(value="/user/user_login_proc",method=RequestMethod.POST)
	public String user_login_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_login_proc start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		userDTO.setPassword(SHAUtill.double_encryption(CmmUtil.nvl(request.getParameter("pwd"))));
		UserDTO ckDTO = userService.login_proc(userDTO); 
		String msg = "";
		String url = "";
		if(ckDTO == null){
			msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
			url = "/user/user_login.do";
		}else if(CmmUtil.nvl(ckDTO.getEmail_first()).equals("N")){
			msg = "이메일 인증을 완료해주세요.";
			url = "/user/user_login.do";
		}else{
			request.getSession().setAttribute("user_no", ckDTO.getUser_no());
			request.getSession().setAttribute("user_id", ckDTO.getUser_id());
			request.getSession().setAttribute("auth", ckDTO.getAuth());
			log.info(ckDTO.getAuth());
			url = "/main.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		msg=null;
		url=null;
		userDTO = null;
		ckDTO = null;
		
		log.info("welcome /user/user_login_proc end");
		return "/redirect";
	}
	
	@RequestMapping(value="/user/user_logout",method=RequestMethod.GET)
	public String user_logout(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_logout start");
		request.getSession().setAttribute("user_no", "");
		request.getSession().setAttribute("user_id", "");
		request.getSession().setAttribute("auth", "");
		log.info("welcome /user/user_logout end");
		model.addAttribute("url","/main.do");
		return "/redirect";
	}
	
	@RequestMapping(value = "/user/user_ck", method = RequestMethod.GET)
	public String email_ck(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("welcome /user/user_ck start");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("uNo")));
		
		userService.update_emailCK(userDTO);
		
		model.addAttribute("msg","이메일 인증이 완료되었습니다.");
		model.addAttribute("url","/main.do");
		
		userDTO = null;
		
		log.info("welcome /user/user_ck end");
		return "/redirect";
	}
	
	@RequestMapping(value="/user/id_found",method=RequestMethod.GET)
	public String id_found_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/id_found_form start");
		return "/user/id_found";
	}
	
	@RequestMapping(value="/user/email_ID",method=RequestMethod.POST)
	public String email_send_ID(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/email_send_test start");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		uDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		
		if(userService.email_send_id(uDTO)){
			model.addAttribute("msg","T");
		}else{
			model.addAttribute("msg","F");
		}
		
		log.info("welcome /user/email_send_test end");
		return "/user/ch_json";
	}
	
	@RequestMapping(value="/user/id_result",method=RequestMethod.POST)
	public String id_found_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/id_found_proc start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setEmail_ck(CmmUtil.nvl(request.getParameter("email_ck")));
		
		UserDTO uDTO = userService.getUser_ID(userDTO);
		if(uDTO == null){
			uDTO = new UserDTO();
		}
		
		String rurl = "";
		
		if(CmmUtil.nvl(uDTO.getUser_id()).equals("")){
			model.addAttribute("msg","인증번호가 틀렸습니다.");
			model.addAttribute("url","/user/id_found.do");
			rurl = "/redirect";
		}else{
			model.addAttribute("uDTO",uDTO);
			rurl = "/user/id_result";
		}
		
		userDTO = null;
		uDTO = null;
		log.info("welcome /user/id_found_proc end");
		return rurl;
	}
	
	@RequestMapping(value="/user/pw_found",method=RequestMethod.GET)
	public String pw_found_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/pw_found_form start");
		return "/user/pw_found";
	}
	
	@RequestMapping(value="/user/email_pw",method=RequestMethod.POST)
	public String email_send_pw(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/email_send_pw start");
		
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		uDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		uDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		
		if(userService.email_send_pw(uDTO)){
			model.addAttribute("msg","T");
		}else{
			model.addAttribute("msg","F");
		}
		
		log.info("welcome /user/email_send_pw end");
		return "/user/ch_json";
	}
	
	@RequestMapping(value="/user/pw_change",method=RequestMethod.POST)
	public String pw_change_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/pw_change_form start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		userDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setEmail_ck(CmmUtil.nvl(request.getParameter("email_ck")));
		
		UserDTO uDTO = userService.get_pwfound(userDTO);
		if(uDTO == null){
			uDTO = new UserDTO();
		}
		
		String rurl = "";
		
		if(CmmUtil.nvl(uDTO.getUser_no()).equals("")){
			model.addAttribute("msg","인증번호가 틀렸습니다.");
			model.addAttribute("url","/user/pw_found.do");
			rurl = "/redirect";
		}else{
			model.addAttribute("uDTO",uDTO);
			rurl = "/user/pw_change";
		}
		
		userDTO = null;
		uDTO = null;
		log.info("welcome /user/pw_change_form end");
		return rurl;
	}
	
	@RequestMapping(value="/user/pw_change_proc",method=RequestMethod.POST)
	public String pw_change_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/pw_change_proc start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDTO.setPassword(SHAUtill.double_encryption(CmmUtil.nvl(request.getParameter("pwd"))));
		
		userService.password_change(userDTO);
		
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		model.addAttribute("url","/user/user_login.do");
		
		userDTO = null;
		log.info("welcome /user/pw_change_proc end");
		return "/redirect";
	}
	
	@RequestMapping(value="/user/id_check",method=RequestMethod.POST)
	public String id_check(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/id_check start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_id(CmmUtil.nvl(request.getParameter("id")));
		
		UserDTO uDTO = userService.id_check(userDTO);
		if(uDTO == null){
			uDTO = new UserDTO();
		}
		
		if(CmmUtil.nvl(uDTO.getUser_id()).equals("")){
			model.addAttribute("msg","Y");
		}else{
			if(CmmUtil.nvl(uDTO.getDelete_yn()).equals("Y")){
				model.addAttribute("msg","Y");
			}else{
				model.addAttribute("msg","N");
			}
		}
		log.info("welcome /user/id_check end");
		return "/user/ch_json";
	}
}
