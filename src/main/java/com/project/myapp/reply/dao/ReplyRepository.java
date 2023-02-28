package com.project.myapp.reply.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.page.model.Criteria;
import com.project.myapp.reply.model.ReplyVo;

public interface ReplyRepository {
	public List<ReplyVo> replyList(@Param("writeNum")int writeNum,@Param("cri") Criteria cri);
	
	public void replyInsert(ReplyVo replyVo);
	
	public void replyDelete(int commentNum);
	
	public void replyEdit(@Param("num")int num,@Param("content") String content);
	
	public int replyTotal(int writeNum);
	
	public List<ReplyVo> replyMypage(@Param("userId")String userId,@Param("cri")Criteria cri);
}
