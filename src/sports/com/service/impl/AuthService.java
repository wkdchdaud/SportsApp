package sports.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import sports.com.dto.UserDTO;
import sports.com.persistance.mapper.AuthMapper;
import sports.com.service.IAuthService;

@Service("AuthService")
public class AuthService implements IAuthService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="AuthMapper")
	private AuthMapper authmapper;

	@Override
	public List<UserDTO> authList() throws Exception {
		
		return authmapper.authList();
	}

	@Override
	public void authUpdate(UserDTO udto) throws Exception {
		authmapper.authUpdate(udto);
	}
	
		
}
