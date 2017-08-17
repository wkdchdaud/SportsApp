package sports.com.controller.admin;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sports.com.dto.ProductFileDTO;
import sports.com.service.IComService;
import sports.com.util.CmmUtil;
import sports.com.util.DateUtil;

@Controller
public class ComController {
	private Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "ComService")
	private IComService comService;
	
	/*	@RequestMapping(value="main",method=RequestMethod.GET)
	public String busimain(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("Wellcom user/usermain");
		System.out.println("test");
		List<TestDTO> list = comService.getCommentList();
		model.addAttribute("list",list);
		return "/main";
	}
	*/
	@RequestMapping(value="/file_test",method=RequestMethod.GET)
	public String file_test(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		log.info("file_test");
		return "test/file_tt";
	}
	
	@RequestMapping(value="/file_reg",method=RequestMethod.POST)
	public String file_reg(@RequestParam("pict") MultipartFile[] files, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		String msg = "";
		log.info("file_reg welcome");
		String FileSaveRootPath = "C:/Users/data8316-23/git/SportsApp/WebContent"; //저장될 웹루트
		
		try{
			
			String user_no = CmmUtil.nvl((String)session.getAttribute("user_no"), "10000001"); //로그인된 사용자 아이디
			int cnt = 0;//카운트
			List<ProductFileDTO> file_list = new ArrayList<ProductFileDTO>();
			
			for(MultipartFile file : files){
				String fileOrgName = file.getOriginalFilename(); //파일 원본 이름 저장
				int pos = fileOrgName.lastIndexOf( "." ); //파일 저장되는 확장자 추출
				String ext = fileOrgName.substring( pos + 1 ).toLowerCase(); //확장자
				
				//이미지 파일이 아니라면 에러 처리
				if (!(ext.equals("jpg")||ext.equals("jpeg")||ext.equals("png")||ext.equals("gif"))){
					throw new Exception("이미지 파일이 아닙니다.");
				}
				
				//저장될 파일 이름
				String fileSaveName = user_no +"_FILE_"+ DateUtil.getDate("yyyyMMddHHmmss")+"_"+cnt +"."+ ext;
				
				//저장 경로
				String savePath = "/upload/product_file/" + DateUtil.getTodayYYYY() + "/" + DateUtil.getTodayMM() + "/" + DateUtil.getTodayDD();
				System.out.println();
				log.info("user_no : "+ user_no);
				log.info("fileOrgName : "+ fileOrgName);
				log.info("ext : "+ ext);
				log.info("fileSaveName : "+ fileSaveName);
				log.info("savePath : "+ savePath);
				
				//실제 파일을 업로드하기 위한 파일 객체 생성
				File f = new File(FileSaveRootPath + savePath + "/"+ fileSaveName);
				
				//폴더가 없다면 폴더 생성
				if (!f.exists()) {
					f.mkdirs();
				}
				
				//파일 저장
				file.transferTo(f);
				
				ProductFileDTO pfDTO = new ProductFileDTO();
				pfDTO.setFile_path(savePath);
				pfDTO.setOrg_filename(fileOrgName);
				pfDTO.setSrc_filename(fileSaveName);
				pfDTO.setReg_user_no(user_no);
				
				file_list.add(pfDTO);
				cnt++;
			}
			//파일 정보 저장하기
			comService.insertFileInfo(file_list);
			msg = "파일 올라감";
			log.info("End file/FileUploadProc !!");

		} catch (IOException e) {
			log.info("ERROR IOException : "+ e.toString());
			msg = e.toString();
		} catch (Exception e) {
			log.info("ERROR Exception : "+ e.toString());
			msg = e.toString();
		}

		model.addAttribute("msg", msg); //메시지 보여주기
		
		return "test/file_result";
	}
}
