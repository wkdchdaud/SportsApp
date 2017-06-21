package sports.com.persistance.mapper;

import config.Mapper;
import sports.com.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {

	void join_proc(UserDTO userDTO) throws Exception;

}
