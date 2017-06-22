package sports.com.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sports.com.dto.UserDTO;
import sports.com.service.IAnalysisService;
import sports.com.service.IUserService;
import sports.com.util.CmmUtil;

public class DataAnalysisController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name="UserService")
	private IAnalysisService analysisService;
	
//	@RequestMapping(value="/admin/data_ana",method=RequestMethod.GET)
//	public String sales_info(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception
//	{
//		
//	}
}
