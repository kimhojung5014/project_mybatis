package com.project.myapp.reply.service;

import org.apache.ibatis.annotations.Param;

public interface ReplyMypageTotalService {
	public int replyMypageTotal(@Param("userId")String userId);
}
