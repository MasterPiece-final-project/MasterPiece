<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="resource/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href="resource/vendor/css/calbootstrap.min.css">
    <link rel="stylesheet" href='resource/vendor/css/select2.min.css' />
    <link rel="stylesheet" href='resource/vendor/css/bootstrap-datetimepicker.min.css' />
    <link rel="stylesheet" href="resource/css/main.css">
    
    <link rel="stylesheet" href="resource/vendor/css/calbootstrap.min.css"> 
</head>
<style>
		
	#msgStack{
		position: fixed;
    	right: 40px; bottom: 40px;
    	padding-top:500px;
   	}
    	
</style>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
	
		<!-- SIDEBAR -->
		<%@include file="../common/project-sidebar.jsp" %>       
	
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
         <div id="content">
            

	
		<!-- Topbar -->
		<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
 		<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav ml-auto">
	
		<!-- Nav Item - User Information -->
			<li class="nav-item dropdown no-arrow">
				<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<c:choose>
						<c:when test="${ loginUser.reProfile eq null }">
							<img class="img-profile rounded-circle" id="profile" name="profile" style="margin-right: 10px" alt="????????? ??????" src="resource/img/undraw_profile.svg">
						</c:when>
						<c:otherwise>
							<img class="img-profile rounded-circle" id="profile" name="profile" style="margin-right: 10px" alt="????????? ??????" src="resource/profileFiles/${ loginUser.reProfile }">
						</c:otherwise>
					</c:choose>	
					<span class="mr-2 d-none d-lg-inline text-gray-600 small">
						<c:out value="${ loginUser.nickName }"/> ??? ???????????????!
					</span>
				 </a>
				<!-- Dropdown - User Information -->
				<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
					<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
						<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							Logout
					</a>
				</div>
			</li>
		
			<div class="topbar-divider d-none d-sm-block"></div>

			<!-- Nav Item - Search Dropdown (Visible Only XS) -->
			<li class="nav-item dropdown no-arrow d-sm-none">
				<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-search fa-fw"></i>
				</a>
		                            
				<!-- Dropdown - Messages -->
			 	<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
					<form class="form-inline mr-auto w-100 navbar-search">
				    	<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
									placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</li>
		<div id="msgStack" style="margin-top:30px;"></div>

		<script>
			function clicktoggle(){
				$.ajax({
					url:'getAlarmList.al',
					data:{projectNo:'${loginUser.currPno}'},
					dataType:'json',
					success:function(data){
						console.log(data);
						
						$alarmList = $("#alaramListDiv");
					    $alarmList.html("");
					    
						if(data.length>0){
							for(var i in data){
								$li = $([
									'<a class="dropdown-item d-flex align-items-center">'
			                        ,'<div class="mr-3">'
			                        ,'    <div class="icon-circle bg-primary">'
			                        ,'        <i class="fas fa-file-alt text-white"></i>'
			                        ,'            </div>'
			                        ,'			</div><div>'
			                        ,'				<div class="small text-gray-500">' + data[i].alarmDate +'</div>'
			                        ,'				<span class="font-weight-bold">'+ data[i].alarmContent +'</span>'				
			                        ,'            		</div>'
			                        ,'					</a>'
			                    ].join(''));   
			                  
			                    
			                    $alarmList.append($li);
							}
	
							
						}
					},
					error:function(data){
						console.log(data);
					}
				});
				
			}
			
			function getAlarmCount(){
				$.ajax({
					url:'getAlarmCount.al',
					data:{projectNo:'${loginUser.currPno}'},
					success:function(data){
						console.log(data);
						if(data.trim() > 0){
							document.getElementById('alertCount').innerHTML = data;
						}else{
							document.getElementById('alarmCounterControl').innerHTML = '';
							
						}
					},
					error:function(data){
						console.log(data);
					}
				});
			}
			
			function showAllAlarm(){
				var newWindow = window.open('allAlarmList.al', '??????' , 'width=380, height=500, resizable=yes, scrollbars=yes, left=200, top=100');
				 newWindow.focus();
			}
			
			$(function(){
				getAlarmCount();
				
				setInterval(function(){
					getAlarmCount();
				}, 5000);
			});
		
			
			var sock = new SockJS("http://localhost:9580/pieceworks/alarm");
			sock.onmessage = onMessage;
			sock.onclose = onClose;
			sock.onopen = onOpen;
		
			function sendMessage() {
				
			}
			
			
			function onMessage(msg) {
				
				var msgData = JSON.parse(msg.data);
				var msgContent = msgData.alarmContent;
				
				console.log(msgContent);
				
				$("#msgStack").html('');
				
			    let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
			    toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>??????</strong>";
			    toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
			    toast += "</button><button type='button' class='btn-close' data-bs-dismiss='toast' aria-label='Close'></button>";
			    toast += "</div> <div class='toast-body'>" + msgContent + "</div></div>";
			    $("#msgStack").append(toast);   // msgStack div??? ????????? toast ??????
			    $(".toast").toast({"animation": true, "autohide": false});
			    $('.toast').toast('show');
			    
			}
			
			
			function onClose(evt) {
				console.log('??????');
			}
			
			
			function onOpen(evt) {
				console.log('?????????');
			}
		
			function sendMsg(){
				console.log('????????????');
				sendMessage();
			}
			
		</script>
		
		<!-- Nav Item - Alerts -->
		<li class="nav-item dropdown no-arrow mx-1">
			<a class="nav-link dropdown-toggle" onclick="clicktoggle();" id="alertsDropdown" role="button"
				data-toggle="dropdown" aria-haspopup="false" aria-expanded="true">
				<i class="fas fa-bell fa-fw"></i>
				<!-- Counter - Alerts -->
				<span id="alarmCounterControl">
				<span class="badge badge-danger badge-counter" id="alertCount"></span>
				</span>
			</a>
			<!-- Dropdown - Alerts -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="alertsDropdown">
				<h3 class="dropdown-header">
					Alerts Center
				</h3>
				<div id="alaramListDiv">
				</div>
				
				<a class="dropdown-item text-center small text-gray-500" onclick="showAllAlarm();">?????? ?????? ??????</a>
			</div>
		</li>
	</ul>
	</nav>
	<!-- End of Topbar -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">?????? ???????????? ???????????????????</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">??</span>
                    </button>
                </div>
                <div class="modal-body">??????????????? ???????????? ????????? '???' ????????? ???????????????</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">??????</button>
                    <a class="btn btn-primary" href="loginView.me"> &nbsp; ??? &nbsp;</a>
                </div>
            </div>
        </div>
    </div>
	
<!------------------------------------- ?????? ?????? ?????? ?????? ------------------------------------------>
					<!-- Begin Page Content -->
					<div class="container-fluid">
                	    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    	    <h1 class="h3 mb-0 text-gray-800">${ list[0].pTitle } ?????? ??????</h1>
                    	    <a href="pDetailViewBack.pr" class="btn btn-light btn-icon-split">
								<span class="icon text-gray-600">
									<i class="fas fa-arrow-left"></i>
								</span>
								<span class="text">?????? ????????????</span>
							</a>
                    	</div>
                    	<br>

						<div class="row">
                       	     <div class="container">

						        <!-- ?????? ????????? ???????????? -->
						        <div id="contextMenu" class="dropdown clearfix">
						            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
						                style="display:block;position:static;margin-bottom:5px;">
						                <li><a tabindex="-1" href="#">?????????</a></li>
						                <li><a tabindex="-1" href="#">?????????</a></li>
						                <li><a tabindex="-1" href="#">??????</a></li>
						                <li class="divider"></li>
						                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
						            </ul>
						        </div>
						
						        <div id="wrapper">
						            <div id="loading"></div>
						            <div id="calendar"></div>
						        </div>
						
						
						        <!-- ?????? ?????? MODAL -->
						        <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
						            <div class="modal-dialog" role="document">
						                <div class="modal-content">
						                    <div class="modal-header">
						                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
						                                aria-hidden="true">&times;</span></button>
						                        <h4 class="modal-title"></h4>
						                    </div>
						                    <div class="modal-body">
												<input type="hidden" id="eventId">
												<input type="hidden" id="projectNo" name="projectNo" value="${ list[0].projectNo }">
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-allDay">????????????</label>
						                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"/>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="creator">?????????</label>
						                                <input class="inputModal" id="nickName" value="${ loginUser.nickName }" readonly/>
						                                <input type="hidden" id="email" value="${ loginUser.email }"/>
						                            </div>
						                        </div>
						
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-title">?????????</label>
						                                <input class="inputModal" type="text" name="edit-title" id="edit-title"
						                                    required="required" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-start">??????</label>
						                                <input class="inputModal" type="text" name="edit-start" id="edit-start" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-end">???</label>
						                                <input class="inputModal" type="text" name="edit-end" id="edit-end" />
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-type">??????</label>
						                                <select class="inputModal" type="text" name="edit-type" id="edit-type">
						                                    <option value="?????????">?????????</option>
						                                    <option value="?????????">?????????</option>
						                                    <option value="??????">??????</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-color">??????</label>
						                                <select class="inputModal" name="color" id="edit-color">
						                                    <option value="#e74a3b" style="color:#e74a3b;">?????????</option>
						                                    <option value="#4e73df" style="color:#4e73df;">?????????</option>
<!-- 						                                    <option value="#858796" style="color:#858796;">??????</option> -->
						                                    <option value="#1cc88a" style="color:#1cc88a;">?????????</option>
						                                    <option value="#36b9cc" style="color:#36b9cc;">?????????</option>
						                                    <option value="#f6c23e" style="color:#f6c23e;">?????????</option>
						                                    <option value="#495057" style="color:#495057;">?????????</option>
						                                </select>
						                            </div>
						                        </div>
						                        <div class="row">
						                            <div class="col-xs-12">
						                                <label class="col-xs-4" for="edit-desc">??????</label>
						                                <textarea rows="4" cols="50" class="inputModal" name="edit-desc"
						                                    id="edit-desc"></textarea>
						                            </div>
						                        </div>
						                    </div>
						                    <div class="modal-footer modalBtnContainer-addEvent">
						                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
						                        <button type="button" class="btn btn-primary" id="save-event">??????</button>
						                    </div>
						                    <div class="modal-footer modalBtnContainer-modifyEvent">
						                        <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
						                        <button type="button" class="btn btn-danger" id="deleteEvent">??????</button>
						                        <button type="button" class="btn btn-primary" id="updateEvent">??????</button>
						                    </div>
						                </div><!-- /.modal-content -->
						            </div><!-- /.modal-dialog -->
						        </div><!-- /.modal -->
						
						        <div class="panel panel-default">
						
						            <div class="panel-heading">
						                <h3 class="panel-title">??????</h3>
						            </div>
						
						            <div class="panel-body">
						
						                <div class="col-lg-6">
						                    <label for="calendar_view">????????????</label>
						                    <div class="input-group">
						                        <select class="filter" id="type_filter" multiple="multiple">
						                            <option value="?????????">?????????</option>
						                            <option value="?????????">?????????</option>
						                            <option value="??????">??????</option>
						                        </select>
						                    </div>
						                </div>
						
						                <div class="col-lg-6">
						                    <label for="calendar_view">????????????</label>
						                    <div class="input-group">
<%-- 						                    <c:forEach var="c" items="${ JSONArray }"> --%>
<!-- 						                    <label class="checkbox-inline"> -->
<%-- 						                    	<input class='filter' type="checkbox" value="${ c.nickName }" checked> --%>
<!-- 						                    </label> -->
						                    
<%-- 						                    </c:forEach> --%>
<%-- 						                    <c:out value="${ JSONArray }" /> --%>
						                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="${ loginUser.nickName }"
						                                checked>${ loginUser.nickName }</label>
 						                        
						                    </div>
						                </div>
						            </div>
						        </div>
						        <!-- /.filter panel -->
						    </div>
						    <!-- /.container -->
						    
						    <!-- ?????? ?????? ????????? ?????? js????????? ??? -->
						    <!-- Bootstrap core JavaScript -->
						    <script src="resource/vendor/jquery/jquery.min.js"></script>
							<script src="resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
							
							<!-- Core plugin JavaScript -->
						    <script src="resource/vendor/jquery-easing/jquery.easing.min.js"></script>
						
							<!-- Custom scripts for all pages -->
						    <script src="resource/js/sb-admin-2.min.js"></script>
							
							
							<!-- ????????? ?????? js ???????????? ??????????????? ????????? -->
						    <script src="resource/vendor/js/jquery.min.js"></script>
						    <script src="resource/vendor/js/bootstrap.min.js"></script>
						    <script src="resource/vendor/js/moment.min.js"></script>
						    <script src="resource/vendor/js/fullcalendar.min.js"></script>
						    <script src="resource/vendor/js/ko.js"></script>
						    <script src="resource/vendor/js/select2.min.js"></script>
						    <script src="resource/vendor/js/bootstrap-datetimepicker.min.js"></script>
						    <script src="resource/js/main.js"></script>
						    <script src="resource/js/addEvent.js"></script>
						    <script src="resource/js/editEvent.js"></script>
						    <script src="resource/js/etcSetting.js"></script>              
                   		</div>					
					</div>
					<!-- container-fluid ??? -->
<!-- ?????? ?????? ??? ?????? -->
			</div>
			<!-- Main Content ??? -->
					
				<!-- FOOTER -->
				<%@include file="../common/footer.jsp" %>
				
			</div>
			<!-- Content Wrapper ??? -->
		</div>
		<!-- Page Wrapper ??? -->    
</body>

</html>