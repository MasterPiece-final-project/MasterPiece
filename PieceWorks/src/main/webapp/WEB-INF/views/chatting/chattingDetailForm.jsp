<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resource/css/chatting-css.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
   <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

   

 
  
  
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
		.messaging{
			padding-bottom: 0px;
		}
		.mesgs{
			width: 100%;
			padding: 10px;
		}
		.received_msg{
			width: 70%;
		}
		.msg_history{
			height: 400px;
			width: 373px;
		}
		.sent_msg p{
			width: 140px;
		}
		.type_msg{
			width: 353px;
		}
		.incoming_msg{
			padding: 10px 0;
		}
		.received_msg p{
			margin: 0px;
		}
		#nickNameText{
			font-size: 10px;
		}
		.dropdown-toggle{
			text-align: right;
		}
		.chatAddMember{
			margin-left: 10px;
		}
		.pImg { 
		width: 15px;	
		height: 15px; 
		border-radius: 100px;
	}
	</style>
	<script type="text/javascript">
	var name = "${loginUser.nickName}";
	var wsocket;
	var userId = "${loginUser.email}";
	
	$(document).ready(function() {
		updateConfirmTime();
		connect();
		var chatAreaHeight = $(".msg_history").height();
		var maxScroll = $(".msgArea").height() - chatAreaHeight;
		$(".msg_history").scrollTop(maxScroll);
		
		
		setInterval(function(){
			updateConfirmTime();
		}, 5000);
	});

	function connect() {
		wsocket = new WebSocket(
				"ws://localhost:9580/pieceworks/chat-ws.ch");
		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;
	}
	function disconnect() {
		wsocket.close();
	}
	function onOpen(evt) {
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '/' + Now.getMonth() + 1 ;
		NowTime += '/' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		NowTime += ':' + Now.getSeconds();
		var userData = {
				"chatMessage":"ENTER-CHAT",
				"sendTime":Now,
				"nickName":name,
				"chatNo":"${chatNo}",
				"chatWriter":"${loginUser.email}",
					"reprofile":"${loginUser.reProfile}"
		};
		let jsonData = JSON.stringify(userData);
		wsocket.send(jsonData);
	}
	 
	function onMessage(evt) {
		let receive = evt.data.split(",");
		const data = {
				"nickName" : receive[0],
				"sendTime" : receive[1],
				"message" : receive[2],
				"reProfile":receive[3]
		};
		console.log(data)
			appendMessage(data);
		
	}
	function onClose(evt) {
		console.log("연결을 끊었습니다.");
	}
	
	function send() {
		updateConfirmTime();
		var msg = $(".write_msg").val();
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '/' + Now.getMonth() + 1 ;
		NowTime += '/' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		NowTime += ':' + Now.getSeconds();

		var userData = {
				"chatMessage":msg,
				"sendTime":Now,
				"nickName":name,
				"chatNo":"${chatNo}",
				"chatWriter": "${loginUser.email}",
				"reprofile":"${loginUser.reProfile}"
		};
		let jsonData = JSON.stringify(userData);
		wsocket.send(jsonData);
		$(".write_msg").val("");
	}

	function appendMessage(data) {
		var Now = new Date();
		var NowTime = Now.getFullYear();
		NowTime += '-' + Now.getMonth() + 1 ;
		NowTime += '-' + Now.getDate();
		NowTime += ' ' + Now.getHours();
		NowTime += ':' + Now.getMinutes();
		NowTime += ':' + Now.getSeconds();
		if(data.nickName==name){
			$('.msgArea').append("<div class='outgoing_msg'> <div class='sent_msg'> <p>" + data.message+"</p> <span class='time_date'>" +NowTime+"</span> </div>");
		}else{
			$('.msgArea').append("<div class='incoming_msg'> <div class='incoming_msg_img'> <img src='resource/profileFiles/+"${data.reprofile }+"' alt='sunil'> </div> <div class='received_msg'> <div class='received_withd_msg'><p id='nickNameText'>"+data.nickName +"</p> <p>"+ data.message+"</p> <span class='time_date'>" +NowTime+"</span></div> </div> </div>");
		}
		var chatAreaHeight = $(".msg_history").height();
		var maxScroll = $(".msgArea").height() - chatAreaHeight;
		$(".msg_history").scrollTop(maxScroll);
	}

	$(document).ready(function() {
		 $(".write_msg").keydown(function(key) {
                if (key.keyCode == 13) {
                	send();	
                }
            });

		$('.msg_send_btn').click(function() { send(); });
		$('#enterBtn').click(function() { connect(); });
		$('#exitBtn').click(function() { disconnect(); });
	});
	
	function updateConfirmTime(){
		$.ajax({
			url:'updateConfirmTime.ch',
			data:{chatNo:"${chatNo}"},
			success:function(data){
				console.log(data);
			},
			error:function(data){
				console.log(data);
			}
		});
	}
	</script>
</head>
<body >

 <!-- 채팅목록 & 채팅창 -->

<span class="chat_date">
 	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	more
                                                </a>
                                                <span class="dropdown-menu dropdown-menu-right animated--fade-in"
                                                    aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" id="chatExit" data-toggle="modal" data-target="#chatExitModal">초대하기</a>
                                                    
                                                </span></span>

           <div class="messaging">
  <div class="inbox_msg">
	<div class="mesgs">
	  <div class="msg_history">
	  <div class="msgArea">
	  <c:forEach var="c" items="${list }">
	 	 <c:choose>
		  	<c:when test="${c.chatWriter eq loginUser.email}">
		  		<div class="outgoing_msg">
				  <div class="sent_msg">
					<p>${c.chatMessage }</p>
			<span class="time_date"> ${c.sendTime }</span> </div>
		</div>
		  	</c:when>
		  	<c:otherwise>
		  	<div class="incoming_msg">
		<div class="incoming_msg_img">
		 <c:choose>
			<c:when test="${c.reprofile == null}">
				 <img class="pImg" id="profile" name="profile" alt="프로필 사진" src="resource/img/undraw_profile.svg">
			 </c:when>
			 <c:otherwise>
					<img class="pImg" id="profile" name="profile" alt="프로필 사진" src="resource/profileFiles/${c.reprofile }">
		
			 </c:otherwise>
		</c:choose>
		  </div>
		  <div class="received_msg">
			<div class="received_withd_msg"><p id="nickNameText">${c.nickName }</p>
			  <p>${c.chatMessage }</p>
			  <span class="time_date">${c.sendTime }</span></div>
		  </div>
		</div>
		  	</c:otherwise>
		  	</c:choose>
		  </c:forEach>
		
		
		
		</div>
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="Type a message" style="width: 300px;"/>
		  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		</div>
	  </div>
	  
	</div>
  </div>
</div>
	     <!-- 나가기 Model -->
	    <div class="modal fade" id="chatExitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방 초대하기</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                
	                 <div class="modal-body">
	                <c:forEach var="ml" items="${memberList }">
					 	<div class="dropdown-divider"></div>
	                        
	                        <div class="chatAddMember">
					<input type="checkbox" name="checkChat" value="${ml.chatMember }">
						<!-- <svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg> -->
					${ml.nickname }</div>
					</c:forEach>  
					</div>
	                <div class="chatBottom" align="right"><input class="chatAllBottom" type="checkbox" name="allCheck">전체선택 </div>
				<script type="text/javascript">
					$('.chatAllBottom').click(function(){
						
						if($('.chatAllBottom').prop("checked")){
							$('input[type=checkbox]').prop('checked',true);
						}else{
							$('input[type=checkbox]').prop('checked',false);
						}
					});	
				</script>
	                
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <span  id="addMember" class="btn btn-primary">초대하기</span>
	                </div>
	               
	            </div>
	        </div>
	    </div>
	    <!-- Bootstrap core JavaScript-->
		    <script src="resource/vendor/jquery/jquery.min.js"></script>
		    <script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		    <!-- Core plugin JavaScript-->
		    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>
		
		    <!-- Custom scripts for all pages-->
		    <script src="resource/js/sb-admin-2.min.js"></script>
</body>
<script type="text/javascript">
$('#addMember').click(function(){
	var userEmail ="";
	$("input:checkbox[name=checkChat]:checked").each(function(index){
		if(index !=0){
			userEmail +=",";
		}
		userEmail +=$(this).val();
	});
	console.log(userEmail);
	location.href="addChatRoomMember.ch?userEmail="+userEmail + "&chatNo="+${chatNo} +"&userId="+'${loginUser.email}';
});
</script>
</html>