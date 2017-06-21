package sports.com.controller;

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
		userDTO.setPwd(CmmUtil.nvl(request.getParameter("pwd")));
		userDTO.setName(CmmUtil.nvl(request.getParameter("name")));
		userDTO.setEmail(CmmUtil.nvl(request.getParameter("email")));
		userDTO.setTel(CmmUtil.nvl(request.getParameter("tel")));
		userService.join_proc(userDTO);
		
		model.addAttribute("msg", "회원가입 성공하였습니다.");
		model.addAttribute("url", "/main.do");
		
		log.info("welcome /user/join_proc end");
		return "/redirect";
	}
	
}
