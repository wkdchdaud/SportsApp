package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.UserDTO;
import sports.com.persistance.mapper.UserMapper;
import sports.com.service.IUserService;
import sports.com.util.AES256Util;
import sports.com.util.CmmUtil;
import sports.com.util.MailUtil;

@Service("UserService")
public class UserService implements IUserService{
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public UserDTO join_proc(UserDTO userDTO) throws Exception {
		UserDTO uDTO= userMapper.get_Max_Userno();
		userDTO.setUser_no(CmmUtil.nvl(uDTO.getUser_no()));
		userMapper.join_proc(userDTO);
		return userMapper.getUser_info(userDTO);
	}

	@Override
	public UserDTO login_proc(UserDTO userDTO) throws Exception {
		return userMapper.login_proc(userDTO);
	}

	@Override
	public List<UserDTO> getUser_list() throws Exception {
		return userMapper.getUser_list();
	}

	@Override
	public UserDTO getUser_info(UserDTO userDTO) throws Exception {
		return userMapper.getUser_info(userDTO);
	}

	@Override
	public void update_User(UserDTO userDTO) throws Exception {
		userMapper.update_User(userDTO);
	}

	@Override
	public void update_User_NP(UserDTO userDTO) throws Exception {
		userMapper.update_User_NP(userDTO);
	}

	@Override
	public void delete_user(UserDTO userDTO) throws Exception {
		userMapper.delete_user(userDTO);
	}

	@Override
	public void update_emailCK(UserDTO userDTO) throws Exception {
		userMapper.update_emailCK(userDTO);
	}

	@Override
	public boolean email_send_id(UserDTO uDTO) throws Exception {
		UserDTO userDTO = userMapper.getID_found(uDTO);
		boolean t_f = false;
		
		if(userDTO == null){
			userDTO = new UserDTO();
		}
		
		if(CmmUtil.nvl(userDTO.getUser_id()).equals("")){
			t_f = false;
		}else{
			String ck = CmmUtil.getNan();
			userDTO.setEmail_ck(ck);
			userMapper.email_send_id(userDTO);
			
			String subject = "인증번호 입니다.";
			String body = "인증번호 : " + ck;
			MailUtil.sendMail(AES256Util.strDecode(userDTO.getEmail()), subject, body);
			
			subject = null;
			body = null;
			t_f = true;
		}
		
		userDTO = null;
		return t_f;
	}

	@Override
	public UserDTO getUser_ID(UserDTO userDTO) throws Exception {
		return userMapper.getUser_ID(userDTO);
	}

	@Override
	public boolean email_send_pw(UserDTO uDTO) throws Exception {
		UserDTO userDTO = userMapper.getpw_found(uDTO);
		boolean t_f = false;
		
		if(userDTO == null){
			userDTO = new UserDTO();
		}
		
		if(CmmUtil.nvl(userDTO.getUser_no()).equals("")){
			t_f = false;
		}else{
			String ck = CmmUtil.getNan();
			userDTO.setEmail_ck(ck);
			userMapper.email_send_pw(userDTO);
			
			String subject = "인증번호 입니다.";
			String body = "인증번호 : " + ck;
			MailUtil.sendMail(AES256Util.strDecode(userDTO.getEmail()), subject, body);
			
			subject = null;
			body = null;
			t_f = true;
		}
		
		userDTO = null;
		return t_f;
	}

	@Override
	public UserDTO get_pwfound(UserDTO userDTO) throws Exception {
		return userMapper.get_pwfound(userDTO);
	}

	@Override
	public void password_change(UserDTO userDTO) throws Exception {
		userMapper.password_change(userDTO);
	}

	@Override
	public UserDTO id_check(UserDTO userDTO) throws Exception {
		return userMapper.id_check(userDTO);
	}
}
