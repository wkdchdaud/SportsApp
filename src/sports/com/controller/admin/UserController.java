package sports.com.controller.admin;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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

@Controller
public class UserController {
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
		userDTO.setPassword(CmmUtil.nvl(request.getParameter("pwd")));
		userDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setTel(CmmUtil.nvl(request.getParameter("tel")));
		UserDTO uDTO = userService.join_proc(userDTO);
		
		model.addAttribute("msg1", "회원가입 성공하였습니다.");
		model.addAttribute("msg2", "이메일 인증을 완료해주세요.");
		model.addAttribute("url", "/main.do");
		
		MailUtil.sendMail(CmmUtil.nvl(request.getParameter("email")), "회원가입을 축하합니다.", 
				"http://localhost:8080/user/user_ck.do?uNo="+CmmUtil.nvl(uDTO.getUser_no()));
		
		userDTO = null;
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
		userDTO.setPassword(CmmUtil.nvl(request.getParameter("pwd")));
		UserDTO ckDTO = userService.login_proc(userDTO); 
		String msg = "";
		String url = "";
		if(ckDTO == null){
			msg = "아이디 혹은 비밀번호가 잘못되었습니다.";
			url = "/user/user_login.do";
		}else{
			request.getSession().setAttribute("user_no", ckDTO.getUser_no());
			request.getSession().setAttribute("user_id", ckDTO.getUser_id());
			request.getSession().setAttribute("auth", ckDTO.getAuth());
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
	
	@RequestMapping(value="/user/user_list",method=RequestMethod.GET)
	public String user_list(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_list start");
		List<UserDTO> rList = userService.getUser_list();
		model.addAttribute("rList",rList);
		
		rList = null;
		log.info("welcome /user/user_list end");
		return "/user/user_list";
	}
	
	@RequestMapping(value="/user/user_info",method=RequestMethod.GET)
	public String user_info(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_info start");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		UserDTO userDTO = userService.getUser_info(uDTO);
		
		model.addAttribute("userDTO",userDTO);
		uDTO = null;
		userDTO = null;
		
		log.info("welcome /user/user_info end");
		return "/user/user_info";
	}
	
	@RequestMapping(value="/user/user_update",method=RequestMethod.GET)
	public String user_update_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_update start");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		UserDTO userDTO = userService.getUser_info(uDTO);
		
		model.addAttribute("userDTO",userDTO);
		uDTO = null;
		userDTO = null;
		
		log.info("welcome /user/user_update end");
		return "/user/user_update";
	}
	
	@RequestMapping(value="/user/user_update_proc",method=RequestMethod.POST)
	public String user_update_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_update_proc start");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDTO.setUser_id(CmmUtil.nvl(request.getParameter("user_id")));
		userDTO.setUser_name(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setTel(CmmUtil.nvl(request.getParameter("tel")));
		
		if(CmmUtil.nvl(request.getParameter("pwd_change")).equals("o")){
			userDTO.setPassword(CmmUtil.nvl(request.getParameter("password")));
			userService.update_User(userDTO);
		}else{
			userService.update_User_NP(userDTO);
		}
		
		String msg = "수정되었습니다.";
		String url = "/user/user_info.do?user_no=" + CmmUtil.nvl(request.getParameter("user_no"));
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		userDTO = null;
		url = null;
		msg = null;
		
		log.info("welcome /user/user_update_proc end");
		return "redirect";
	}
	
	@RequestMapping(value="/user/user_delete",method=RequestMethod.POST)
	public String user_delete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /user/user_delete start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		
		userService.delete_user(userDTO);
		
		String msg = "탈퇴되었습니다.";
		String url = "/user/user_list.do";
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		userDTO = null;
		url = null;
		msg = null;
		
		log.info("welcome /user/user_delete end");
		return "redirect";
	}
	
	@RequestMapping(value = "/user/user_ck", method = RequestMethod.GET)
	public String email_ck(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		log.info("welcome /user/user_ck start");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("uNo")));
		
		userService.update_emailCK(userDTO);
		
		model.addAttribute("msg","이메일 인증이 완료되었습니다.");
		model.addAttribute("url","/main.do");
		
		log.info("welcome /user/user_ck end");
		return "/redirect";
	}
}
