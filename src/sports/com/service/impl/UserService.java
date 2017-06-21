package sports.com.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import sports.com.dto.UserDTO;
import sports.com.persistance.mapper.UserMapper;
import sports.com.service.IUserService;

@Service("UserService")
public class UserService implements IUserService{
	@Resource(name="UserMapper")
	private UserMapper userMapper;

	@Override
	public void join_proc(UserDTO userDTO) throws Exception {
		userMapper.join_proc(userDTO);
	}
}
