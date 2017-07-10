package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.UserDTO;
import sports.com.persistance.mapper.UserMapper;
import sports.com.service.IUserService;
import sports.com.util.CmmUtil;

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
}
