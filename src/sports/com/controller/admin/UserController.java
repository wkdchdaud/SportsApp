package sports.com.controller.admin;

import java.util.List;

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
import sports.com.util.AES256Util;
import sports.com.util.CmmUtil;
import sports.com.util.MailUtil;
import sports.com.util.SHAUtill;

@Controller
public class UserController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	/* 그냥 유저 리스트*/
	@RequestMapping(value="/admin/user/user_list",method=RequestMethod.GET)
	public String user_list(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_list start");
		List<UserDTO> rList = userService.getUser_list();
		model.addAttribute("rList",rList);
		
		rList = null;
		log.info("welcome /admin/user/user_list end");
		return "/user/user_list";
	}
	
	/* 유저 리스트 검색 */
	@RequestMapping(value="/admin/user/user_list",method=RequestMethod.POST)
	public String user_list_search(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_list_search start");
		UserDTO userDTO = new UserDTO();
		userDTO.setS_type(CmmUtil.nvl(request.getParameter("s_type")));
		userDTO.setS_text(CmmUtil.nvl(request.getParameter("s_text")));
		
		if(CmmUtil.nvl(request.getParameter("s_type")).equals("no") || CmmUtil.nvl(request.getParameter("s_type")).equals("")){
			List<UserDTO> rList = userService.getUser_list();
			model.addAttribute("rList",rList);
			rList = null;
		}else{
			List<UserDTO> rList = userService.getUser_list_search(userDTO);
			model.addAttribute("rList",rList);
			rList = null;
		}
		log.info("welcome /admin/user/user_list_search end");
		return "/user/user_list";
	}
	
	@RequestMapping(value="/admin/user/user_info",method=RequestMethod.GET)
	public String user_info(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_info start");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		UserDTO userDTO = userService.getUser_info(uDTO);
		
		model.addAttribute("userDTO",userDTO);
		uDTO = null;
		userDTO = null;
		
		log.info("welcome /admin/user/user_info end");
		return "/user/user_info";
	}
	
	@RequestMapping(value="/admin/user/user_change",method=RequestMethod.GET)
	public String user_update_form(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_update start");
		UserDTO uDTO = new UserDTO();
		uDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		UserDTO userDTO = userService.getUser_info(uDTO);
		
		model.addAttribute("userDTO",userDTO);
		uDTO = null;
		userDTO = null;
		
		log.info("welcome /admin/user/user_update end");
		return "/user/user_change";
	}
	
	@RequestMapping(value="/admin/user/user_update_proc",method=RequestMethod.POST)
	public String user_update_proc(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_update_proc start");
		
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDTO.setUser_id(AES256Util.strEncode(CmmUtil.nvl(request.getParameter("id"))));
		userDTO.setUser_name(AES256Util.strEncode(CmmUtil.nvl(request.getParameter("name"))));
		userDTO.setEmail(AES256Util.strEncode(CmmUtil.nvl(request.getParameter("email"))));
		userDTO.setTel(AES256Util.strEncode(CmmUtil.nvl(request.getParameter("tel"))));
		
		if(CmmUtil.nvl(request.getParameter("pwd_change")).equals("o")){
			userDTO.setPassword(SHAUtill.double_encryption(CmmUtil.nvl(request.getParameter("pwd"))));
			userService.update_User(userDTO);
		}else{
			userService.update_User_NP(userDTO);
		}
		
		String msg = "수정되었습니다.";
		String url = "/admin/user/user_info.do?user_no=" + CmmUtil.nvl(request.getParameter("user_no"));
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		userDTO = null;
		url = null;
		msg = null;
		
		log.info("welcome /admin/user/user_update_proc end");
		return "redirect";
	}
	
	@RequestMapping(value="/admin/user/user_delete",method=RequestMethod.POST)
	public String user_delete(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception{
		log.info("welcome /admin/user/user_delete start");
		UserDTO userDTO = new UserDTO();
		userDTO.setUser_no(CmmUtil.nvl(request.getParameter("user_no")));
		userDTO.setChg_user_no(CmmUtil.nvl((String)request.getSession().getAttribute("user_no")));
		userService.delete_user(userDTO);
		
		String msg = "탈퇴되었습니다.";
		String url = "/admin/user/user_list.do";
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		
		userDTO = null;
		url = null;
		msg = null;
		
		log.info("welcome /admin/user/user_delete end");
		return "redirect";
	}
}
