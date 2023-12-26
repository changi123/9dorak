<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${cpath}/resources/css/styleguide.css"
	type="text/css" />
<link rel="stylesheet"
	href="${cpath}/resources/css/adminNoticeStyle.css?d" type="text/css" />
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="shortcut icon"
	href="${cpath}/resources/images/favicon/favicon.ico">
<title>9도락 관리자페이지</title>
</head>
<body>
	<div class=e2099_2373>
		<div class="e2099_2463"></div>
		<div class="e2099_2467"></div>
		<div class="e2099_2471">
			<hr>
		</div>
		<div class="e2099_2483"></div>
		<span class="e2099_2468">메뉴관리</span> <span class="e2099_2469">회원관리</span>
		<span class="e2099_2470">주문관리</span> <span class="e2099_2472">구독관리</span>
		<span class="e2099_2473" onclick="location.href='${cpath}/admin/adminNotice.do'">게시판관리</span> <span class="e2099_2474">이벤트관리</span>
		<span class="e2099_2475">쿠폰/포인트관리</span>
		<div class="admin_login">
			<div class="e2099_2476">
				<hr>
			</div>
			<div class="e2099_2478"></div>
			<span class="e2099_2477">관리자</span>
			<div class="e2101_2491"></div>
			<span class="e2101_2490">로그아웃</span>
		</div>
		<div class="e2099_2485"></div>
		<div class="e2099_2486">
		
			<div class="e2099_2487">
				<!-- 	<button class="notice-btn" onclick="toggleTable('notice')">공지사항</button>
				<button class="faq-btn" onclick="toggleTable('faq')">자주 묻는
					질문</button> -->
			</div>
			<div id="noticeTable" class="table-container">
				
				<form action="">
				FAQ 제목 : <input type="text" id="faq_title"/> <br />
				FAQ 내용 : <textarea id="faq_cont" ></textarea><br />
				</form>
			</div>
			<button id="noticeFaqInsert">등록</button>
			<div id="faqTable" class="table-container"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(".e2099_2468").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminMenu.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	$(".e2099_2469").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminMember.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	$(".e2099_2470").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminOrder.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	$(".e2099_2472").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminSub.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	$(".e2099_2474").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminEvent.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	$(".e2099_2475").on("click", function() {
		$.ajax({

			url : "${cpath}/admin/adminPoint.do",
			type : "get",
			success : function(res) {
				$("body").html(res);
			}

		})
	})

	function toggleTable(tableType) {
		var noticeTable = document.getElementById("noticeTable");
		var faqTable = document.getElementById("faqTable");

		if (tableType === 'notice') {
			noticeTable.style.display = "block";
			faqTable.style.display = "none";
		} else if (tableType === 'faq') {
			noticeTable.style.display = "none";
			faqTable.style.display = "block";
		}
	}
	

	$("#noticeFaqInsert").on("click",function(){

	 	var param ={
			faq_title : $("#faq_title").val(),
			faq_cont : $("#faq_cont").val()
			
		} 
	
		$.ajax({
			url : "${cpath}/admin/adminNoticeFaqInsert.do",
			data : param,
			type : "post",
			success: function(res){
				alert(res);
				location.href="${cpath}/admin/adminNotice.do";
			}
		})
		
	})
</script>
</html>