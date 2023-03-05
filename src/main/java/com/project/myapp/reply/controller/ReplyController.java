package com.project.myapp.reply.controller;

import java.util.List;

import javax.sound.sampled.LineListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.myapp.page.model.Criteria;
import com.project.myapp.page.model.PageMakerVo;
import com.project.myapp.reply.model.ReplyVo;
import com.project.myapp.reply.service.ReplyDeleteService;
import com.project.myapp.reply.service.ReplyEditService;
import com.project.myapp.reply.service.ReplyInsertService;
import com.project.myapp.reply.service.ReplyMypage;
import com.project.myapp.reply.service.ReplyMypageTotalService;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyInsertService	replyInsertService;
	
	@PostMapping(value = "replyInsert")
	public String replyInsert(ReplyVo replyVo) {
		
		replyInsertService.replyInsert(replyVo);
		return "redirect:/inToBoard?writeNum="+replyVo.getWriteNum();
	}
	
	@Autowired
	ReplyDeleteService replyDeleteService;
	
//	@GetMapping(value = "replyDelete")
//	public String replyDelete(int commentNum, int writeNum) {
//		replyDeleteService.replyDelete(commentNum);
//		return "redirect:/inToBoard?writeNum="+writeNum;
//	}
	@GetMapping(value = "replyDelete")
	public String replyDelete(int commentNum, int writeNum,@RequestParam(value = "userId",required = false)String userId) {
		replyDeleteService.replyDelete(commentNum);
		if (writeNum == 0) {
			return "redirect:/replyMypage?userId="+userId;
		}
		return "redirect:/inToBoard?writeNum="+writeNum;
	}
	
	@Autowired
	ReplyEditService replyEditService;
	
	@PostMapping(value = "replyEdit")
	public String replyEdit(int num, String content,int writeNum) {
		replyEditService.replyEdit(num, content);
		return "redirect:/inToBoard?writeNum="+writeNum;
	}
	
	@Autowired
	ReplyMypage replyMypage;
	@Autowired
	ReplyMypageTotalService replyMypageTotalServiceImpl;
	
	@GetMapping(value = "replyMypage")
	public String replyMypage(String userId,Criteria cri, Model model) {
		List<ReplyVo>replyList =  replyMypage.replyMypage(userId,cri);
		
		int total = replyMypageTotalServiceImpl.replyMypageTotal(userId);
		
		PageMakerVo pageMake = new PageMakerVo(cri, total);
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("replyList",replyList);
		return "member/reply";
	}
}
