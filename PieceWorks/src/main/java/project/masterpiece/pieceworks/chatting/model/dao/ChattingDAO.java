package project.masterpiece.pieceworks.chatting.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import project.masterpiece.pieceworks.chatting.model.vo.ChattingAddMember;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingCheckRoom;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingInvite;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingList;
import project.masterpiece.pieceworks.chatting.model.vo.ChattingMessage;
import project.masterpiece.pieceworks.member.model.vo.Member;

@Repository("cDAO")
public class ChattingDAO {

	

	public ArrayList<ChattingMessage> selectChattingMessageList(SqlSessionTemplate sqlSession,
			ChattingMessage c) {
		
				
		return (ArrayList)sqlSession.selectList("chattingMapper.selectChattingMessageList",c);
	}

	public ArrayList<ChattingList> selectChattingList(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("chattingMapper.selectChattingList", m);
	}

	
	public int insertChatting(SqlSessionTemplate sqlSession, ChattingMessage chatMessage) {
		return sqlSession.insert("chattingMapper.insertChatting",chatMessage);
	}

	public int insertChatRoom(SqlSessionTemplate sqlSession, ChattingInvite ci) {
		return sqlSession.insert("chattingMapper.insertChatRoom", ci);
	}

	public int insertChatJoin(SqlSessionTemplate sqlSession, ArrayList<String> eList) {
		return sqlSession.update("chattingMapper.insertChatJoin", eList);
	}

	public int insertFirstMeg(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.insert("chattingMapper.insertFirstMeg", map);
	}

	public int updateChatTitle(SqlSessionTemplate sqlSession, ChattingList cl) {
		return sqlSession.update("chattingMapper.updateChatTitle", cl);
	}

	public int chatRoomOut(SqlSessionTemplate sqlSession, ChattingMessage cm) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chattingMapper.chatRoomOut", cm);
	}

	public int insertOutMeg(SqlSessionTemplate sqlSession, ChattingMessage cm) {
		return sqlSession.insert("chattingMapper.insertOutMeg", cm);
	}

	public int joinMemberCount(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.selectOne("chattingMapper.joinMemberCount", chatNo);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.update("chattingMapper.deleteRoom", chatNo);
	}

	public int deleteChatJoinMem(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.delete("chattingMapper.deleteChatJoinMem", chatNo);
	}

	public int getRoomNum(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("chattingMapper.getRoomNum");
	}


	public ArrayList<Member> selectProjectMemList(SqlSessionTemplate sqlSession, int projectNum) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectProjectMemList", projectNum);
	}
	
	public ArrayList<ChattingAddMember> cAddMemberList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("chattingMapper.cAddMemberList", map);
	}

	public int selectProjectNo(SqlSessionTemplate sqlSession, int chatNo) {
		return sqlSession.selectOne("chattingMapper.projectNo", chatNo);
	}

	public int insertChattingMember(SqlSessionTemplate sqlSession, ArrayList<ChattingCheckRoom> list) {
		return sqlSession.insert("chattingMapper.insertChattingMember",list);
	}

	public int updateConfirmTime(SqlSessionTemplate sqlSession, ChattingMessage cm) {
		return sqlSession.update("chattingMapper.updateConfirmTime", cm);
	}

	public int getPChatAlarmCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("chattingMapper.getPChatAlarmCount", m);
	}

	public String selectProjectName(SqlSessionTemplate sqlSession, int projectNum) {
		return sqlSession.selectOne("chattingMapper.selectProjectName", projectNum);
	}
}
