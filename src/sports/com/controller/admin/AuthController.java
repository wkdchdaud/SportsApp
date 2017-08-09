package sports.com.controller.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import sports.com.dto.UserDTO;
import sports.com.service.IAuthService;

@Controller
public class AuthController {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AuthService")
	private IAuthService authService;
	
	@RequestMapping(value="/admin/auth/list")
	public String authList(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception
	{
		log.info("this.getClass().getName() : " + this.getClass().getName());
		log.info("getClass().getName() : " + getClass().getName());
		
		List<UserDTO> udto = authService.authList();
		
		/*for (UserDTO dataUdto : udto){
			System.out.println("dataUdto.getAuth(); : "+ dataUdto.getAuth());
			System.out.println("dataUdto.id(); : "+ AES256Util.strDecode(dataUdto.getUser_id()));
			System.out.println("dataUdto.User_no(); : "+ dataUdto.getUser_no());
			System.out.println("dataUdto.USER_NAME(); : "+ AES256Util.strDecode(dataUdto.getUser_name()));
		}*/
		
		model.addAttribute("udto", udto);
		udto = null;
		return "/admin/Auth/AuthList";
		
		
	}
	
}
