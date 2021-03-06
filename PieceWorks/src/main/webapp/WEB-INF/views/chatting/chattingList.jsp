<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>${ projectName } 채팅</title>
    <link rel="icon" href="resource/img/favicon.png">
    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resource/css/chatting-css.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
</head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap');
body {
	font-family: 'Roboto', sans-serif;
}
	.topchatbar{
		display: flex;
		max-width : 50%;
		margin: 0;
		padding-left : 0.75rem;
		padding-right : 0.75rem;
		justify-content: space-between;
		font-size: 25px;
		margin-bottom: 15px;
		
	}
	.topchatbar .chatadd{
		color : white;
	}
	
	.card-body{
		width: auto;
		margin: 0 10px;
		padding-top : 0px;
		display: flex;
		/*justify-content: space-between;*/
	}
	.chatpreview{
		
		width: auto;
		margin: 0 10px;
		padding : 0 20px 0 20px;
		display: flex;
		/*justify-content: space-between;*/
		
	}
	
	#chat-more-button{
		position: absolute;
		display : none;
		width: 70px;
		background-color: white;
		border: 1px solid black;
	}
	.col-lg-6 {
    flex: 0 0 90%;
    max-width: 90%;
}
.topchatbar{
	    max-width: 90%;
}
	
	.inbox_people{
		width:100%;
	}
	
	.recent_heading{
		margin-top:10px;
	}
	
	.chatadd{
		margin-top:-5px;
		margin-right:-5px;
	}
	
	.timemargin{
		margin-right:23px;
	}
	.unreadMessage{
	color:white;
	border-radius:10px;
	text-align:center;
	width:20px;
	background-color:red;
	display:inline-block;
	
	}
	
	.unread{
	display:inline-block;
	margin-top:7px;
	margin-left:25px;
	}
	.chatTitle{
	display:inline-block;
	}
	.joinMem{
	display:inline-block;
	text-align:center;
	}
	
	#navbarDropdown{
		padding-top:5px;
		padding-left:20px;
	}
	
	.rounded-circle{
	height:55.63px;
	width:55.63px;
	}
	
	.chat_img{
	width:55.63px;
	height:55.63px;
	}
	
	.twoprofile{
	border-radius: 19px;
	-moz-border-radius: 19px;
	-khtml-border-radius: 19px;
	-webkit-border-radius: 19px;
	}
	
	
	
	.recent_heading{
		color:#152FB0;
		font-size:18px;
		margin-bottom:10px;
	}
	
	#exampleModalLabel{
		color:#152FB0;
		margin-top:10px;
		margin-left:10px;
		
	}
	
	#clbutton.close{
	margin-top:-43px;
	}
	
	.chat_list{
		width:556px;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function getChattingList(){

	$.ajax({
		url:'getChatList.ch',
		dataType:'json',
		success:function(data){
			console.log(data);
			
			$chatList = $("#wholeChatList");
		    $chatList.html("<table id='tb'>");
		    
			if(data.length>0){
				for(var i in data){
					$li = $([
						'<tr><td><div class="chat_list" onmouseover="chatMouseOver(this);" onmouseout="chatMouseLeave(this);" ondblclick="chatDeatilGo('+ data[i].chatNo + ', this)">'
                        ,'<div class="chat_people">'
                        ,'    <div class="chat_img"></div>'
                        ,'        <div class="chat_ib">'
                        ,'            <h5 class="innerh5">'
                        ,'				<strong><div class="chatTitle"></div></strong><div class="joinMem"><img src="resource/img/personemo.png" style="height:15px; width:20px; margin-bottom:5px; margin-left:7px;"/> ' + data[i].joinMemCount + '</div>'
                        ,'				<span class="chat_date"><div class="chat_dateDiv"></div><div class="unread"></div><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"'
                        ,'				role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">'				
                        ,'            		more'
                        ,'					</a>'	
                        ,'        <span class="dropdown-menu dropdown-menu-right animated--fade-in" aria-labelledby="navbarDropdown">'
                        ,'			<div class="outRoom"></div>'
                        ,'			<div class="modifyRoom"></div>'
                        ,'			<div class="deleteRoom"><div>'	
                        ,'    	</span></span></h5>'
                        ,'		<p class="chatmeg"></p>'		
                        ,'</div></div></div></td></tr>'
                    ].join(''));   
                  
					
					if(data[i].joinMember.length > 4){
						var chatimghtml = '';
                		var count = 0;
                		
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				if(data[i].joinMember[j].reProfile == null){
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; width:28px; height:28px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else if(count == 1){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-left:30px; width:28px; height:28px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else if(count == 2){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-top:30px; width:28px; height:28px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-left:30px; margin-top:30px; width:28px; height:28px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                						break;
                					}
                				}else{
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; width:28px; height:28px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else if(count == 1){
                						chatimghtml += '<img class="twoprofile" style="position:absolute;  margin-left:30px; width:28px; height:28px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else if(count == 2){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-top:30px; width:28px; height:28px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute;  margin-left:30px; margin-top:30px; width:28px; height:28px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                						break;
                					}
                				}
                				count++;
                			}
                		}
 
                		$li.find(".chat_img").html(chatimghtml);
					}
					if(data[i].joinMember.length == 4){
						var chatimghtml = '';
                		var count = 0;
                		
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				if(data[i].joinMember[j].reProfile == null){
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-left:12px; width:32px; height:32px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else if(count == 1){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-top:25px; width:32px; height:32px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-left:25px; margin-top:25px; width:32px; height:32px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}
                				}else{
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style="margin-left:12px; position:absolute; width:32px; height:32px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else if(count == 1){
                						chatimghtml += '<img class="twoprofile" style="position:absolute;  margin-top:25px; width:32px; height:32px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-left:25px; margin-top:25px; width:32px; height:32px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}
                				}
                				count++;
                			}
                		}
 
                		$li.find(".chat_img").html(chatimghtml);
					}
					
                	if(data[i].joinMember.length == 3){
                		var chatimghtml = '';
                		var count = 0;
                		
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				if(data[i].joinMember[j].reProfile == null){
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style="position:absolute; width:40px; height:40px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-top:20px; margin-left:20px; width:40px; height:40px;" src="resource/img/undraw_profile.svg" alt="sunil">';
                					}
                				}else{
                					if(count == 0){
                						chatimghtml += '<img class="twoprofile" style=" position:absolute; width:40px; height:40px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}else{
                						chatimghtml += '<img class="twoprofile" style="position:absolute; margin-top:20px; margin-left:20px; width:40px; height:40px;" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">';
                					}
                				}
                				count++;
                			}
                		}
 
                		$li.find(".chat_img").html(chatimghtml);
                	}else if(data[i].joinMember.length == 2){
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				if(data[i].joinMember[j].reProfile == null){
                					$li.find(".chat_img").html('<img class="twoprofile" src="resource/img/undraw_profile.svg" alt="sunil">');
                					break;
                				}else{
                					$li.find(".chat_img").html('<img class="img-profile rounded-circle twoprofile" alt="sunil" src="resource/profileFiles/' + data[i].joinMember[j].reProfile + '">');
                					break;
                				}
                			}
                		}
                	}
                	
                	var chatMemStr = "";
                	if(data[i].chatTitle == null){
                		for(var j in data[i].joinMember){
                			if("${ loginUser.email }" != data[i].joinMember[j].chatMember){
                				chatMemStr += data[i].joinMember[j].memberName + " ";
                				if(chatMemStr.length >= 20){
                					chatMemStr = chatMemStr.substring(0,20) + '...';
                					break;
                				}
                				}
                		}
                		
                		
                		if(data[i].joinMember.length == 1 && "${loginUser.email}" == data[i].joinMember[0].chatMember){
                			chatMemStr = "대화 상대 없음";
                		}
                		$li.find(".chatTitle").text(chatMemStr);
                	}else{
                		if(data[i].chatTitle.length > 20){
                			$li.find(".chatTitle").text(data[i].chatTitle.substring(0,20) + '...');
                			
                		}else{
                			$li.find(".chatTitle").text(data[i].chatTitle);
                		}
                	}
                	
                	if(data[i].unreadCount > 0){
                		$li.find(".unread").html('<div class="unreadMessage">' + data[i].unreadCount + '</div>');
                	}
                	
                	if(data[i].sendDate >= "${ today }"){
                		var timeFmV = '';
                		var hours = 0;
                		timeFmV += data[i].sendTime.substring(9,11)
                		timeFmV += ' ' + data[i].sendTime.substring(0,2) + ':';
                		timeFmV += data[i].sendTime.substring(3,5);
                		
                		$li.find(".chat_dateDiv").text(timeFmV);
                	}else{
                		$li.find(".chat_dateDiv").text(data[i].sendDate);
                	}
                	
                	$li.find(".outRoom").html('<a class="dropdown-item" id="chatExit" data-toggle="modal" data-target="#chatExitModal" onclick="outRoom(' + data[i].chatNo + ', `${ loginUser.email }`, `${ loginUser.nickName }`);">나가기</a>');
                    
                    if(data[i].joinMember.length > 2 && "${ loginUser.email }" == data[i].chatCreator){
                    	$li.find('.modifyRoom').html('<a class="dropdown-item" id="chatNameChange" data-toggle="modal" data-target="#chatNameChangeModal"  onclick="modifyRoomName(' + data[i].chatNo + ', `' + data[i].chatTitle + '`)"' + '>이름수정</a>');
                    }																																						
                    
                    
                    if("${ loginUser.email }" == data[i].chatCreator){
                    	$li.find('.deleteRoom').html('<a class="dropdown-item" id="chatDelete" data-toggle="modal" data-target="#chatDeleteModal" onclick="deleteRoom(' + data[i].chatNo + ');">삭제</a>');
                    }
                    
                    $li.find(".chatmeg").text(data[i].chatMessage);
                    
                    $chatList.append($li);
                    $chatList.append('</table>');
				}

				
			}else{
				
				
				
			}
			
		},
		error:function(data){
			console.log(data);
		}
	});
}

var controlvar = 0;

$(function(){
	getChattingList();
	var isCreate = ${ isCreate };
	if(isCreate == true){
		document.getElementById("chatNumber").value = "${ chatRoomNum }";
		var newWindow = window.open('chattingDetailForm.ch?chatNo=${chatRoomNum}', '채팅' , 'width=400, height=500, resizable=yes, scrollbars=yes, left=200, top=100');
		 newWindow.focus();
		 frm.target="채팅";
		
		frm.submit();

		 
	}

	
	setInterval(function(){
		getChattingList();
		sendMessage();
	}, 5000);
});

function chatMouseOver(me){
	me.style.backgroundColor = "#D2D6EB";
	me.childNodes[0].childNodes[3].lastChild.style.color = "black";
}
function chatMouseLeave(me){
	me.style.backgroundColor = "#F5F5F5";
	me.childNodes[0].childNodes[3].lastChild.style.color = "gray";
}

function chatDeatilGo(num, me){
	
	document.getElementById("chatNumber").value = num;
	 var newWindow = window.open('chattingDetailForm.ch?chatNo=${chatRoomNum}', '채팅' , 'width=380, height=500, resizable=yes, scrollbars=yes, left=200, top=100');
	 newWindow.focus();
	 frm.target="채팅";
	 frm.submit();
}


function modifyRoomName(num, title){
	if(title == 'undefined'){
		document.getElementById("exampleModalLabelchange").value = '새로운 채팅방 이름 입력';
	}else{
		document.getElementById("exampleModalLabelchange").value = title;
	}
	
	document.getElementById("chatNumber").value=num;

}

function updateChatName(){
	var chatNum = document.getElementById("chatNumber").value;
	var chatTitle = document.getElementById("exampleModalLabelchange").value;
	
	var yesorno = confirm(chatTitle + "로(으로) 채팅방 이름을 변경하시겠습니까?");
	if(yesorno == true){
	location.href="updateChatTitle.ch?chatNo="+chatNum+"&chatTitle="+chatTitle;
	}
	
}

function outRoom(chatNo, userEmail, nickName){
	document.getElementById("chatNumber").value=chatNo;
	document.getElementById("userEmail").value=userEmail;
	document.getElementById("userNick").value=nickName;
}

function outRoomClick(){
	var chatNo = document.getElementById("chatNumber").value;
	var email = document.getElementById("userEmail").value;
	var nickName = document.getElementById("userNick").value;
	
	location.href="chatRoomOut.ch?chatNo="+chatNo +"&userEmail="+email + "&nickName=" + nickName;
}

function deleteRoom(chatNo){
	document.getElementById("chatNumber").value=chatNo;
}

function deleteRoomClick(){
	var chatNo = document.getElementById("chatNumber").value;
	
	location.href="deleteRoom.ch?chatNo="+chatNo;
}
</script>
<body id="page-top">
	<form action="chattingDetailForm.ch" method="post" name="frm">
	<input type="hidden" id="chatNumber" name="chatNo">
	</form>
	<input type="hidden" id="userEmail" name="userEmail">
	<input type="hidden" id="userNick" name="userNick">
	<input type="hidden" id="chk_id" name="chk_id">
	<div class="inbox_people">
	  <div class="headind_srch">
		<div class="recent_heading">
		  <b>${ projectName }</b> 채팅
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
<!-- 			 <input type="text" class="search-bar"  placeholder="Search" > -->
			<div class="chatadd">
						<div class="my-2"></div>
                                    <a href="#" class="btn btn-primary btn-icon-split">
                                        <span class="icon text-white-50">
                                          	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
</svg>
                                        </span>
                                        <span class="text" id="chatAdd" data-toggle="modal" data-target="#chatAddModal">채팅방 만들기</span>
                                    </a>
					</div>
			</div>
		</div>
	  </div>
	  <div id="wholeChatList">
	</div>
	  </div>
		
		


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
	 <!-- chatAdd Modal-->
	    <div class="modal fade" id="chatAddModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방 만들기</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close" id="clbutton">
	                        <span aria-hidden="true" id="clspan">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">
							<div class="input-group">
	                            <input type="text" id="chatRoomName" class="form-control bg-light border-0 small" placeholder="채팅방 이름 ..."
	                                aria-label="Search" aria-describedby="basic-addon2">
	                        </div>
	                        
	                         <div class="dropdown-divider"></div>
	                        <c:forEach var="m" items="${ mArr }">
	                        <c:if test="${ loginUser.email ne m.email}">
	                       
	                        <div class="PMNicks">
	                        
					<input type="checkbox" name="checkChat" value="${ m.email }" class="projectmem">
					<input type="hidden" value="${ m.nickName }" name="memname">
					<c:if test="${ m.reProfile ne null}">
					<img class="twoprofile" style="margin-left:5px; width:36px; height:36px;" src="resource/profileFiles/${ m.reProfile }">
					</c:if>
					<c:if test="${ m.reProfile eq null}">
					<img class="twoprofile" style="margin-left:5px; width:36px; height:36px;" src="resource/img/undraw_profile.svg" alt="sunil">
					</c:if>
                    ${ m.nickName }<div class="dropdown-divider"></div></div></c:if>
                   	
					</c:forEach>
				
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
	                        
					</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" onclick="invite();">초대하기</a>
	                </div>
	                
	                <script>
	                	function invite(){
	                		var chk_id = [];
	                		var memberName = [];
	                		
	                		$(".projectmem:checked").each(function(){
	                			var id = $(this).val();
	                			var name = $(this).next().val();
	                			memberName.push(name);
	                			chk_id.push(id);
	                		});
	                		
                            memberName.push('${loginUser.nickName}');
                            chk_id.push('${loginUser.email}');
                            
	                		var roomName = document.getElementById("chatRoomName").value;
	                		document.getElementById("chk_id").value = chk_id;
	                		
	                		var yesorno = confirm("입력한 정보로 채팅방을 생성하시겠습니까?");
	                		if(yesorno == true){
	                			controlvar = 1;
	                			sendMessage();
	       						setTimeout(function(){
	       							location.href="chattingInvite.ch?emails="+chk_id+"&roomName="+roomName+"&memberNames="+memberName;
		                			alert("채팅방이 생성되었습니다.");
	       						}, 1500);
	       						controlvar = 0;
	                		}
	                	}
	                	
	                	var sock = new SockJS("http://localhost:9580/pieceworks/alarm");
	            		sock.onmessage = onMessage;
	            		sock.onclose = onClose;
	            		sock.onopen = onOpen;
	            	
	            		function sendMessage() {
	            			// 내 메시지 서버로 보내기
	            			var message = '${ loginUser.nickName }님이 회원님을 채팅방에 초대했습니다.';
	            			var emails = document.getElementById("chk_id").value;
	            			
	            			if(controlvar == 0){
	            			var data = {
	            					"alarmContent" : '연결이 풀리지않게',
	            					"alarmType" : 1,
	            					"projectNo" : '${loginUser.currPno}'
	            	            };
	            			}else{
	            				var data = {
		            					"alarmContent" : message,
		            					"recipient" : emails,
		            					"alarmType" : 1,
		            					"projectNo" : '${loginUser.currPno}'
		            	            };
	            			}
	            	        var jsonData = JSON.stringify(data);
	            	        console.log(jsonData);
	            	       
	            	        sock.send(jsonData);
	            		}
	            		
	            		
	            		function onMessage(msg) {
	            		}
	            		
	            		
	            		function onClose(evt) {
	            			console.log('나감');
	            		}
	            		
	            		
	            		function onOpen(evt) {
	            			console.log('들어옴');
	            		}
	            		
	                </script>
	            </div>
	        </div>
	    </div>
	    
	    <!-- 나가기 Model -->
	    <div class="modal fade" id="chatExitModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방을 나가시겠습니까?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" onclick="outRoomClick();">나가기</a>
	                </div>
	               
	            </div>
	        </div>
	    </div>
	    
	    <!-- 채팅방 이름수정 Model -->
	    <div class="modal fade" id="chatNameChangeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방 이름 수정</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="채팅방 이름..."
	                                aria-label="Search" aria-describedby="basic-addon2" value="채팅방 이름" id="exampleModalLabelchange">
	                        </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
	                    <a class="btn btn-primary" onclick="updateChatName();">수정</a>
	                </div>
	               
	            </div>
	        </div>
	    </div>
	    
	    <!-- 채팅 삭제 Model -->
	    <div class="modal fade" id="chatDeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
	        aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방을 삭제하시겠습니까?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" onclick="deleteRoomClick();">삭제하기</a>
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

<!-- 인클루드 넣을자리 -->

</body>
</html>