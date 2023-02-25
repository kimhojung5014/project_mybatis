package com.project.myapp.member.dao;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.member.model.JoinVo;

public interface JoinRepository {

	public void insertJoin(JoinVo joinVo);
	
	public boolean idCheck(String id);
	
	public boolean nickNameCheck(String nick);
	
	public JoinVo login(@Param("id") String id,@Param("pw") String pw);
	
	public void edit(JoinVo joinVo);
	
	public String searchId(@Param("userName")String userName,@Param("eMail") String eMail, @Param("telNumber")String telNumber);
	
	public int searchPw(@Param("userId")String userId,@Param("eMail") String eMail, @Param("telNumber")String telNumber);
	
	public void resetPw(@Param("userId")String userId, @Param("pw") String pw);
}
