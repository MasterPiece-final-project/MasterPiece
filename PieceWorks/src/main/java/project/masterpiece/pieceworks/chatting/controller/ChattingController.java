package project.masterpiece.pieceworks.chatting.controller;



import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import project.masterpiece.pieceworks.chatting.model.ChattingException;
import project.masterpiece.pieceworks.chatting.model.service.ChattingService;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

@SessionAttributes("today")
@Controller
public class ChattingController {

	@Autowired
	private ChattingService cService;
	
	
	@RequestMapping("chattest.ch")
	public String read() {
		return "chattingTest";
	}
	
	@RequestMapping("chatForm.ch")
	public String chatForm() {
		return "chattingForm";
	}


	@RequestMapping("chatList.ch")
	public String chatList(Model model) {
		java.util.Date date = new java.util.Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = simpleDateFormat.format(date);
        java.sql.Date sqlDate = null;
         String[] dateArr = formattedDate.split("-");
         int year = Integer.parseInt(dateArr[0]);
         int month = Integer.parseInt(dateArr[1])-1;
         int day = Integer.parseInt(dateArr[2]);
         
         sqlDate = new java.sql.Date(new GregorianCalendar(year,month,day).getTimeInMillis());
	      
         model.addAttribute("today", sqlDate);
         
         return "chattingList";
	}
	
	@RequestMapping("getChatList.ch")
	public void getChatList(HttpServletRequest request, HttpServletResponse response, Model model) {
		String email = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		ArrayList<ChattingList> list = new ArrayList<ChattingList>();
		list = cService.selectChattingList(email);
		
		if(list != null) {
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			
			Gson gson = gb.create();
			try {
				gson.toJson(list, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			throw new ChattingException("채팅목록 불러오기 실패");
		}
	}
	
	@RequestMapping("chattingDetailForm.ch")
	public ModelAndView chattingDetailForm(@ModelAttribute ChattingMessage c,ModelAndView mv) {
	
		/*public ModelAndView chattingDetailForm(@RequestParam("chatWriter") String chatWriter,
		@RequestParam("anotherUserId") String anotherUserId,@RequestParam("chatNo") int chatNo,ModelAndView mv) {*/
	/*채팅 메세지 불러오기
	 채팅방 번호 , 본인 아이디, 클릭 한 채팅 아이디 가져오기*/
	/*
	 * HashMap<Object, Object> map = new HashMap<Object, Object>();
	 * map.put("chatWriter", chatWriter); map.put("anotherUserId", anotherUserId);
	 * map.put("chatNo", chatNo);
	 */
	
	
	ArrayList<ChattingMessage> list = new ArrayList<ChattingMessage>();
	list = cService.selectChattingMessageList(c);

	if(list != null) {
		mv.addObject("chatNo",c.getChatNo());
		mv.addObject("userId",c.getChatWriter());
		mv.addObject("list",list);
		mv.setViewName("chattingDetailForm");
	}else {
		throw new ChattingException("게시글 전체 조회에 실패하였습니다.");
	}
	return mv;
}
	
	
}
