package project.masterpiece.pieceworks.chatting.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ChattingController {

	//private ChattingService cService;
	
	
	@RequestMapping("chattest.ch")
	public String read() {
		return "chattingTest";
	}
	
	@RequestMapping("chatForm.ch")
	public String chatForm() {
		return "chattingForm";
	}
	
	
	
	
}
