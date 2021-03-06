package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import project.masterpiece.pieceworks.chatting.model.vo.ChattingAddMember;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingCheckRoom;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

public interface ChattingService {



	ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c);

	ArrayList<ChattingList> selectChattingList(Member m);

	int insertChatting(ChattingMessage chatMessage);

	int insertChatRoom(ChattingInvite ci);

	int insertChatJoin(ArrayList<String> eList);

	int insertFirstMeg(HashMap<String, String> map);

	int updateChatTitle(ChattingList cl);

	int chatRoomOut(ChattingMessage cm);

	int insertOutMeg(ChattingMessage cm);

	int joinMemberCount(int chatNo);

	int deleteRoom(int chatNo);

	int deleteChatJoinMem(int chatNo);

	int getRoomNum();
	
	ArrayList<Member> selectProjectMemList(int projectNum);
	
	ArrayList<ChattingAddMember> cAddMemberList(HashMap<String, Integer> map);

	int selectProjectNo(int chatNo);

	int insertChattingMember(ArrayList<ChattingCheckRoom> list);

	int updateConfirmTime(ChattingMessage cm);

	int getPChatAlarmCount(Member m);

	String selectProjectName(int projectNum);
}
