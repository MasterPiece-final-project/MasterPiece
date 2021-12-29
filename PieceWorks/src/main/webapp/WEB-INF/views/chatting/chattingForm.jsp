<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ChattingForm</title>

    <!-- Custom fonts for this template-->
    <link href="resource/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="resource/css/sb-admin-2.min.css" rel="stylesheet">
    
  <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="resource/css/chatting-css.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</head>
<style>
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
		justify-content: space-between;
	}
	.chatpreview{
		
		width: auto;
		margin: 0 10px;
		padding : 0 20px 0 20px;
		display: flex;
		justify-content: space-between;
		
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
	
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/3.2.0/lodash.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item active">
                <a class="nav-link" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse show" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item active" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Pages</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="login.html">Login</a>
                        <a class="collapse-item" href="register.html">Register</a>
                        <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                        <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                       

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Douglas McGee</span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
         
				<!-- chattingForm -->
				<div class="topchatbar">
					<div>채팅</div>
					<div class="chatadd">
						<div class="my-2"></div>
                                    <a href="#" class="btn btn-success btn-icon-split">
                                        <span class="icon text-white-50">
                                          	 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
  <path d="M8 0a1 1 0 0 1 1 1v6h6a1 1 0 1 1 0 2H9v6a1 1 0 1 1-2 0V9H1a1 1 0 0 1 0-2h6V1a1 1 0 0 1 1-1z"/>
</svg>
                                        </span>
                                        <span class="text" id="chatAdd" data-toggle="modal" data-target="#chatAddModal">채팅방 만들기</span>
                                    </a>
					</div>
				</div>
            
            <!-- 채팅목록 & 채팅창 -->
           <div class="messaging">
  <div class="inbox_msg">
	<div class="inbox_people">
	  <div class="headind_srch">
		<div class="recent_heading">
		  <h4>Recent</h4>
		</div>
		<div class="srch_bar">
		  <div class="stylish-input-group">
			<input type="text" class="search-bar"  placeholder="Search" >
			</div>
		</div>
	  </div>
	  <div class="inbox_chat scroll">
		<div class="chat_list active_chat">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>남나눔 <span class="chat_date">Dec 25<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                                                    role="button" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false">
                                                    	more
                                                </a>
                                                <span class="dropdown-menu dropdown-menu-right animated--fade-in"
                                                    aria-labelledby="navbarDropdown">
                                                    <a class="dropdown-item" id="chatExit" data-toggle="modal" data-target="#chatExitModal">나가기</a>
                                                    <a class="dropdown-item" id="chatNameChange" data-toggle="modal" data-target="#chatNameChangeModal">이름수정</a>
                                                   
                                                    <a class="dropdown-item" id="chatDelete" data-toggle="modal" data-target="#chatDeleteModal">삭제</a>
                                                </span></span></h5>
			  <p>뭐해?</p>
			</div>
		  </div>
		</div>
		<div class="chat_list">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://mblogthumb-phinf.pstatic.net/20151212_254/julielove450_1449914547821gAtcQ_PNG/20151212_1850201.png?type=w2" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>도대담 <span class="chat_date">12월21일 </span></h5>
			  <p>채팅 다 됐나요?</p>
			</div>
		  </div>
		</div>
		<div class="chat_list">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://mblogthumb-phinf.pstatic.net/20151212_49/julielove450_1449914543022Ay9Hy_PNG/20151212_1853531.png?type=w2" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>라라 <span class="chat_date">12월21일</span></h5>
			  <p>와 진짜 어렵다</p>
			</div>
		  </div>
		</div>
		<div class="chat_list">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://mblogthumb-phinf.pstatic.net/20151212_142/julielove450_1449914543209lVxLD_PNG/20151212_1853471.png?type=w2" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>단체 채팅 <span class="chat_date">12월19일</span></h5>
			  <p>이러쿵 저러쿵 </p>
			</div>
		  </div>
		</div>
		<div class="chat_list">
		  <div class="chat_people">
			<div class="chat_img"> <img src="https://mblogthumb-phinf.pstatic.net/20151212_169/julielove450_1449914543507Qdsmn_PNG/20151212_1852371.png?type=w2" alt="sunil"> </div>
			<div class="chat_ib">
			  <h5>채팅 팀원 <span class="chat_date">12월18일</span></h5>
			  <p>더 이상 쓸 채팅이 없다 뭔가 길게 쓰고 싶은데 딱히 생각나는게 없네요 ㅎㅎ</p>
			</div>
		  </div>
		</div>
		
	  </div>
	</div>
	<div class="mesgs">
	  <div class="msg_history">
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>채팅 테스트</p>
			  <span class="time_date"> 11:01 AM    |    June 9</span></div>
		  </div>
		</div>
		<div class="outgoing_msg">
		  <div class="sent_msg">
			<p>오 대박</p>
			<span class="time_date"> 11:01 AM    |    June 9</span> </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>하이하이</p>
			  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
		  </div>
		</div>
		<div class="outgoing_msg">
		  <div class="sent_msg">
			<p>ㅇㅋㅇㅋ</p>
			<span class="time_date"> 11:01 AM    |    Today</span> </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>아무말 적기</p>
			  <span class="time_date"> 11:01 AM    |    Today</span></div>
		  </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>...</p>
			  <span class="time_date"> 11:01 AM    |    Today</span></div>
		  </div>
		</div>
		<div class="incoming_msg">
		  <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
		  <div class="received_msg">
			<div class="received_withd_msg">
			  <p>ㅏㅏㅏㅏㅏㅏㅏㅏ</p>
			  <span class="time_date"> 11:01 AM    |    Today</span></div>
		  </div>
		</div>
	  </div>
	  <div class="type_msg">
		<div class="input_msg_write">
		  <input type="text" class="write_msg" placeholder="Type a message" />
		  <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
		</div>
	  </div>
	  
	</div>
  </div>
</div>
         
            
            
            
            
            
                
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

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
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
	                <div class="modal-body">
							<div class="input-group">
	                            <input type="text" class="form-control bg-light border-0 small" placeholder="채팅방 이름 ..."
	                                aria-label="Search" aria-describedby="basic-addon2">
	                        </div>
	                        
	                        <div class="dropdown-divider"></div>
	                        
	                        <div>
					<input type="checkbox" name="checkChat">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					간겅강</div>
					<div class="dropdown-divider"></div>
					<div><input type="checkbox" name="checkChat">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					남나눔</div>
					<div class="dropdown-divider"></div>
					<div><input type="checkbox" name="checkChat">
						<svg
						 xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
			  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
			  <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
					도대담
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
	                        
					</div>
	                <div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">초대하기</a>
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
	                    <h5 class="modal-title" id="exampleModalLabel">채팅방을 나가시겠습니까?</h5>
	                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                    </button>
	                </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">나가기</a>
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
	                                aria-label="Search" aria-describedby="basic-addon2" value="채팅방 이름">
	                        </div>
					<div class="modal-footer">
	                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
	                    <a class="btn btn-primary" href="login.html">나가기</a>
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
	                    <a class="btn btn-primary" href="login.html">삭제하기</a>
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