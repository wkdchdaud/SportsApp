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
import sports.com.util.CmmUtil;

@Controller
public class AcademyController {
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "AcademyService")
	private IAcademyService academyService;

	@RequestMapping("acamap")
	public String adminacmap(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "�п� ��Ʈ�ѷ� start!");

		List<AcademyDTO> list = academyService.getAcaList();
		model.addAttribute("list", list);

		System.out.println("ac ��Ʈ�ѷ� end");
		return "/admin/Academy/AcaMap";

	}
	@RequestMapping("accountmanagement")
	public String Accmanag(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info(this.getClass().getName() + "�ŷ�ó���� ��Ʈ�ѷ� start!");

		List<AcademyDTO> rlist = academyService.getAccountList();
		System.out.println("");
		
		// ����Ʈ ��������
		
		if (rlist==null){
			rlist = new ArrayList<AcademyDTO>();
		}
		
		model.addAttribute("rlist", rlist);
		
		//���� �ʱ�ȭ(�޸� ȿ��ȭ ��Ű�� ���� �����)
		rlist = null;
		
		//�α� ���(���� ���� �α׸� ���� �� �Լ� ȣ���� �������� �ľ��ϱ� �����ϴ�.)
		log.info(this.getClass().getName() + "�ŷ�ó���� end!");

		System.out.println("acc ��Ʈ�ѷ� end");
		return "/admin/Academy/AccountManagement";
	}
	
	@RequestMapping("accountreg")
	public String accountReg(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {

		log.info("�ŷ�ó ��� ��Ʈ�ѷ� ");

		return "/admin/Academy/AccountInsert";
		
	}
	
	@RequestMapping(value="accountinsert", method=RequestMethod.POST)
	public String NoticeInsert(HttpSession session, HttpServletRequest request, HttpServletResponse response, 
			ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + ".accountInsert start!");
		
		String msg = "";
		
		try{
			/*
			 * �Խ��� �� ��ϵǱ� ���� ���Ǵ� form��ü�� ���� input ��ü ���� �޾ƿ��� ���� �����
			 * */
			String aca_no = CmmUtil.nvl(request.getParameter("aca_no")); //���̵�
			String aca_name = CmmUtil.nvl(request.getParameter("aca_name")); //����
			String aca_area1 = CmmUtil.nvl(request.getParameter("aca_area1")); //������ ����
			String aca_area2 = CmmUtil.nvl(request.getParameter("aca_area2")); //������ ����
	
			/*
			 * #######################################################
			 * 	 �ݵ��, ���� �޾�����, �� �α׸� �� ���� ����� �������� �ľ��ؾ���
			 * 						�ݵ�� �ۼ��� ��
			 * #######################################################
			 * */
			log.info("aca_no : "+ aca_no);
			log.info("aca_name : "+ aca_name);
			log.info("aca_area1 : "+ aca_area1);
			log.info("aca_area1 : "+ aca_area2);		
			
			AcademyDTO aDTO = new AcademyDTO();
			
			aDTO.setAca_no(aca_no);
			aDTO.setAca_name(aca_name);
			aDTO.setAca_area1(aca_area1);;
			aDTO.setAca_area2(aca_area2);
	
			
			/*
			 * �Խñ� ����ϱ����� ����Ͻ� ������ ȣ��
			 * */
			academyService.AccountInsert(aDTO);

			
			//������ �Ϸ�Ǹ� ����ڿ��� ������ �޽���
			msg = "��ϵǾ����ϴ�.";
			
			
			//���� �ʱ�ȭ(�޸� ȿ��ȭ ��Ű�� ���� �����)
			aDTO = null;
			
		}catch(Exception e){
			
			//������ ���еǸ� ����ڿ��� ������ �޽���			
			msg = "�����Ͽ����ϴ�. : "+ e.toString();
			log.info(e.toString());
			e.printStackTrace();
			
		}finally{
			log.info(this.getClass().getName() + ".AcInsert end!");
			
			//��� �޽��� �����ϱ�
			model.addAttribute("msg", msg);
			
		}
		
		return "/admin/Academy/AccountMsg";
	}	
	
	
}
