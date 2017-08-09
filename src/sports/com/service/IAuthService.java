package sports.com.service;

import java.util.List;

import sports.com.dto.UserDTO;

public interface IAuthService {
	
	public List<UserDTO> authList() throws Exception;
	public void authUpdate(UserDTO udto) throws Exception;
}
