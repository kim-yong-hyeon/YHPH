<%@page import="com.DTO.ChatDTO"%>
<%@page import="com.DAO.QuestionDAO"%>
<%@page import="com.DTO.QuestionDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DTO.CLASS_MEMBER_DTO"%>
<%@page import="com.DAO.CLASS_MEMBER_DAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
H5
  <title>h5</title>



  <!-- Custom fonts for this template -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
	<% ChatDTO chatdto =(ChatDTO)session.getAttribute("chatdto"); %>
	<% CLASS_MEMBER_DTO info =(CLASS_MEMBER_DTO)session.getAttribute("info"); %>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Login.jsp">
        <div class="sidebar-brand-icon rotate-n-15">
        </div>
        <img style="width:160px; margin-left: 10px"src="img/logo.png">
        <div class="sidebar-brand-text mx-3"></div>
      </a>

      <!-- Divider -->


      <!-- Nav Item - Tables -->
      
      
      <li class="nav-item active">
        <a class="nav-link" href="mypage_s.jsp">
          <i class="fas fa-fw fa-table"></i>
          <span>학생 마이페이지</span></a>
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
          <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
          </form>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"> <%=info.getNickname() %> </span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="forgot-password.jsp">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  	회원 정보 수정
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="LogoutService.do" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  	로그아웃
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
       <div class="container-fluid">
        <form name="폼이름">
        <input type="text" name="input_text" size="50" value="http://localhost:8033/gitproject/chat.jsp?cnt=">
       <input type = "button" class = "d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" value="채팅방 입장" onClick="location.href=this.form.input_text.value">
       </form>
          <!-- Page Heading -->
          <!--  <h1 class="h3 mb-2 text-gray-800">마이 페이지 (학생)</h1>
          <p class="mb-4">나의 회원 등급과 질문을 볼 수 있어요.</p>-->

          <!-- ëì íì ë±ê¸ ì´í´ë³´ê¸° -->
          
            
            <div class="card-body">
            
              <!-- <div class="card-header py-3">ì§ë¬¸ì ë§ì´ í  ìë¡ ë±ê¸ì´ ì¬ë¼ì!</div> -->
          
              
              <!-- 나의 회원 등급을 progress bar 형태로 보여주기 (계정 주인의 회원 등급에 맞게 나타나게끔 코드 변경 필요 => aria-valuenow를 조정)-->
              


          <!-- 마이 페이지 (학생)에서 나의 질문 내역 데이터 불러오기 -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">나의 질문 보기</h6>
            </div>
            
              <% 
               QuestionDAO dao = new QuestionDAO();
                 ArrayList<QuestionDTO> studentlist = new ArrayList<QuestionDTO>();
                 studentlist = dao.viewQ(info.getNickname());
         %>

			          
             <div class="card-body">  
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>질문 내용</th> 
                    </tr>
                  </thead>
             <tbody>
                  <% for (int i = 1; i < studentlist.size(); i++) { %>
                       <tr>
                         <td><%= studentlist.get(i).getQuestion() %></td>
                       </tr>
                    <% } %>
                  </tbody>

                </table>
              </div>
            </div>
          </div>

        </div>

      </div>

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2020</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">Ã</span>
          </button>
        </div>
        <div class="modal-body">로그아웃 하시겠습니까?</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
          <a class="btn btn-primary" href="Login.jsp">로그아웃</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>
