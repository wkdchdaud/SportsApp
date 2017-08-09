package sports.com.controller.admin;

import java.util.Enumeration;
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
	
	@RequestMapping(value="/admin/auth/update")
	public String authUpdate(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws Exception
	{
		log.info("this.getClass().getName() : " + this.getClass().getName());
		log.info("getClass().getName() : " + getClass().getName());
	
		String[] updatechk = request.getParameterValues("deleteSelect");
		
		UserDTO udto = new UserDTO();
		
		for (String Uo : updatechk ){
			String qqq[] = Uo.split(",");
			
			System.out.println("qqq[0] :"+qqq[0]);
			System.out.println("qqq[1] :"+qqq[1]);
			
			udto.setUser_no(qqq[0]);
			udto.setAuth(qqq[1]);
/*			System.out.println("udto.getUser_no() : " +udto.getUser_no());
			System.out.println("udto.getauth() : " +udto.getAuth());*/
			authService.authUpdate(udto);
			
			
		}
		udto= null;
		
		model.addAttribute("msg","선택된 회원권한 수정에 성공하였습니다.");
		model.addAttribute("url","/admin/auth/list.do");
		
		return "/redirect";
		
		
	}
	
}
