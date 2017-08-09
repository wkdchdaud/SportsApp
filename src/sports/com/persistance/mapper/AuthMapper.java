package sports.com.persistance.mapper;

import java.util.List;

import org.apache.log4j.Logger;

import config.Mapper;
import sports.com.dto.UserDTO;

@Mapper("AuthMapper")
public interface AuthMapper {
	
	public List<UserDTO> authList() throws Exception ;
	
	public void authUpdate(UserDTO udto) throws Exception ; 

}
