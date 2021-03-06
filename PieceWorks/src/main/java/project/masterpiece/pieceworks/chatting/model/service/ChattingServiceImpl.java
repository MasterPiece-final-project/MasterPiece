package project.masterpiece.pieceworks.chatting.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.masterpiece.pieceworks.chatting.model.dao.ChattingDAO;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingAddMember;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingCheckRoom;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Service("cService")
public class ChattingServiceImpl implements ChattingService{

	@Autowired
	private ChattingDAO cDAO;
		
	@Autowired
	private SqlSessionTemplate sqlSession;
	


	@Override
	public ArrayList<ChattingMessage> selectChattingMessageList(ChattingMessage c) {
		return cDAO.selectChattingMessageList(sqlSession,c);
	}

	@Override
	public ArrayList<ChattingList> selectChattingList(Member m) {
		return cDAO.selectChattingList(sqlSession, m);
	}


	@Override
	public int insertChatting(ChattingMessage chatMessage) {
		return cDAO.insertChatting(sqlSession,chatMessage);
	}

	@Override
	public int insertChatRoom(ChattingInvite ci) {
		return cDAO.insertChatRoom(sqlSession,ci);
	}

	@Override
	public int insertChatJoin(ArrayList<String> eList) {
		return cDAO.insertChatJoin(sqlSession,eList);
	}

	@Override
	public int insertFirstMeg(HashMap<String, String> map) {
		return cDAO.insertFirstMeg(sqlSession, map);
	}

	@Override
	public int updateChatTitle(ChattingList cl) {
		return cDAO.updateChatTitle(sqlSession, cl);
	}

	@Override
	public int chatRoomOut(ChattingMessage cm) {
		return cDAO.chatRoomOut(sqlSession, cm);
	}

	@Override
	public int insertOutMeg(ChattingMessage cm) {
		return cDAO.insertOutMeg(sqlSession, cm);
	}

	@Override
	public int joinMemberCount(int chatNo) {
		return cDAO.joinMemberCount(sqlSession, chatNo);
	}

	@Override
	public int deleteRoom(int chatNo) {
		return cDAO.deleteRoom(sqlSession, chatNo);
	}

	@Override
	public int deleteChatJoinMem(int chatNo) {
		return cDAO.deleteChatJoinMem(sqlSession, chatNo);
	}

	@Override
	public int getRoomNum() {
		return cDAO.getRoomNum(sqlSession);
	}

	@Override
	public ArrayList<Member> selectProjectMemList(int projectNum) {
		return cDAO.selectProjectMemList(sqlSession, projectNum);
	}
	
	@Override
	public ArrayList<ChattingAddMember> cAddMemberList(HashMap<String, Integer> map) {
		return cDAO.cAddMemberList(sqlSession,map);
	}

	@Override
	public int selectProjectNo(int chatNo) {
		return cDAO.selectProjectNo(sqlSession,chatNo);
	}

	@Override
	public int insertChattingMember(ArrayList<ChattingCheckRoom> list) {
		return cDAO.insertChattingMember(sqlSession,list);
	}

	@Override
	public int updateConfirmTime(ChattingMessage cm) {
		return cDAO.updateConfirmTime(sqlSession, cm);
	}

	@Override
	public int getPChatAlarmCount(Member m) {
		return cDAO.getPChatAlarmCount(sqlSession, m);
	}

	@Override
	public String selectProjectName(int projectNum) {
		return cDAO.selectProjectName(sqlSession, projectNum);
	}
}
