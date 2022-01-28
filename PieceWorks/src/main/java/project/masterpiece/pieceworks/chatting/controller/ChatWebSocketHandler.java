package project.masterpiece.pieceworks.chatting.controller;





import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import project.masterpiece.pieceworks.chatting.model.service.ChattingService;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;

@Controller
public class ChatWebSocketHandler extends TextWebSocketHandler{
	
	@Autowired
	ChattingService cService;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatWebSocketHandler.class);
	//채팅방 목록 
	private Map<String,ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	//session, 방 번호
	 private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	 
	
	 
	@Override
	public void afterConnectionEstablished(
			WebSocketSession session) throws Exception {
		log(session.getId() + " 제발 연결");
		
	}

	@Override
	public void afterConnectionClosed(
			WebSocketSession session, CloseStatus status) throws Exception {
		log(session.getId() + " 연결 종료되라ㅏㅏ");
		if(sessionList.get(session) != null) {
			RoomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
		}
	
	}

	@Override
	protected void handleTextMessage(
			WebSocketSession session, TextMessage message) throws Exception {
		//전달 받은 메세지 
		String msg = message.getPayload();
		Gson gson = new Gson();
		
		//JSON객체에서 JAVA객체로 변환
		//chatNo이 
		ChattingMessage chatMessage = gson.fromJson(msg, ChattingMessage.class);
		System.out.println("chattingMessage로 변환 : " + chatMessage);
		
		//roomId string형으로 변환
		String roomId = Integer.toString(chatMessage.getChatNo());
		
		//채팅세션에 처음 들어오면서 채팅방 존재하지 않을때
		if(RoomList.get(roomId) ==null && chatMessage.getChatMessage().equals("ENTER-CHAT")) {
		
			//채팅방에 들어갈  session들
			ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
		
			//1. 접속시 접소 메세지 보냄
			//2. 받은 메시지에 있는 룸 아이디 받음 10
			//3. RoomList에 접속한 룸 아이디와 session을 넣음 10,session
			sessionTwo.add(session);
			
			//sessionList에 roomId추가
			 sessionList.put(session, roomId);
			 
			 //roomList에 추가
			RoomList.put(roomId, sessionTwo);
			System.out.println("채팅방 생성");
			
			
			//users.put(roomId, session);
			//만들어진 채팅방이 존재 할 때
		}else if(RoomList.get(roomId) !=null && chatMessage.getChatMessage().equals("ENTER-CHAT")) {
			
			//roomList에서 해당 방 번호를 가진 방이 있는 지 확인
			RoomList.get(roomId).add(session);
			
			//sessionList에 roomId와 session추가
			sessionList.put(session, roomId);
			System.out.println("생성된 채팅방으로 입장");
			
			
			//채팅 메시지 전송할 시
		}else {
			System.out.println(chatMessage);
			
			//메세지 내용을 담는다.
			TextMessage textMessage = new TextMessage(chatMessage.getNickName() + "," + chatMessage.getSendTime() + "," + chatMessage.getChatMessage() + "," + chatMessage.getReprofile());
			System.out.println("보내는 메세지 : " + textMessage);
			//들어온 채팅방roomId에 속해있는 sessionId사람들에게만 message 전송
			for (WebSocketSession sess : RoomList.get(roomId)) {
				sess.sendMessage(textMessage);
			}
			
			//DB에 값 넣기
			//msg,nickname,chatNo,writer,현재시간,본인아이디.
			int result = cService.insertChatting(chatMessage);
			if(result >0) {
				System.out.println("메세지전송 및 DB저장 성공");
			}else {
				System.out.println("메세지 전송 실패! & DB 저장 실패!");
			}
		}
		
		
		
		
//		log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
//		for (WebSocketSession s : users.values()) {
//			s.sendMessage(message);
//			log(s.getId() + "에 메시지 발송: " + message.getPayload());
//		}
	}

	@Override
	public void handleTransportError(
			WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	}

	private void log(String logmsg) {
		LOGGER.info(new Date() + " : " + logmsg);
	}

	

}
