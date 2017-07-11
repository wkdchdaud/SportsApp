package sports.com.service;

import java.util.List;

import sports.com.dto.UserDTO;

public interface IUserService {

	UserDTO join_proc(UserDTO userDTO) throws Exception;

	UserDTO login_proc(UserDTO userDTO) throws Exception;

	List<UserDTO> getUser_list() throws Exception;

	UserDTO getUser_info(UserDTO userDTO) throws Exception;

	void update_User(UserDTO userDTO) throws Exception;

	void update_User_NP(UserDTO userDTO) throws Exception;

	void delete_user(UserDTO userDTO) throws Exception;

	void update_emailCK(UserDTO userDTO) throws Exception;

	boolean email_send_id(UserDTO uDTO) throws Exception;

	UserDTO getUser_ID(UserDTO userDTO) throws Exception;

	boolean email_send_pw(UserDTO uDTO) throws Exception;

	UserDTO get_pwfound(UserDTO userDTO) throws Exception;

	void password_change(UserDTO userDTO) throws Exception;


}
