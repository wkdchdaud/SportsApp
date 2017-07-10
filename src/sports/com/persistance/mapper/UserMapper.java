package sports.com.persistance.mapper;

import java.util.List;

import config.Mapper;
import sports.com.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {

	void join_proc(UserDTO userDTO) throws Exception;

	UserDTO get_Max_Userno() throws Exception;

	UserDTO login_proc(UserDTO userDTO) throws Exception;

	List<UserDTO> getUser_list() throws Exception;

	UserDTO getUser_info(UserDTO userDTO) throws Exception;

	void update_User(UserDTO userDTO) throws Exception;

	void update_User_NP(UserDTO userDTO) throws Exception;

	void delete_user(UserDTO userDTO) throws Exception;

	void update_emailCK(UserDTO userDTO) throws Exception;


}
