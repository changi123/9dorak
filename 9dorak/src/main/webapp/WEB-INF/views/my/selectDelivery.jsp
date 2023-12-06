<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
input {
	width: 300px;
}
</style>
</head>
<body>
	<input type="text" id="mem_delname" placeholder="배송지명" value="${memDel.mem_delname }" readonly="readonly">
	<br>
	<input type="text" id="sample4_postcode" placeholder="우편번호" readonly="readonly"/>
	<input type="button" onclick="sample4_execDaumPostcode()"
		value="우편번호 찾기">
	<br>
	<input type="text" id="sample4_roadAddress" placeholder="도로명주소" readonly="readonly" />
	<input type="text" id="sample4_jibunAddress" placeholder="지번주소" readonly="readonly"/>
	<span id="guide" style="color: #999; display: none"></span>
	<input type="text" id="sample4_detailAddress" placeholder="상세주소" readonly="readonly">
	<input type="text" id="sample4_extraAddress" placeholder="참고항목" readonly="readonly"/>
	<br />
	<c:if test="${not empty memDel.mem_delname}">
		<button id="update">수정</button>
	</c:if>
	<c:if test="${empty memDel.mem_delname}">
		<button id="success">완료</button>
	</c:if>



	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>
</body>
<script>
	$("#success").on(
			"click",
			function() {

				if ($("#mem_delname").val() == "") {
					alert("배송지명을 입력해주세요 ( 필수 )");
					return;
				}

				var mem_addr;

				if ($("#sample4_jibunAddress").val() == "") {
					mem_addr = $("#guide").text().substring(12,
							$("#guide").text().length - 1);
				} else {
					mem_addr = $("#sample4_jibunAddress").val();
				}

				var mem_zipcode = $("#sample4_postcode").val();
				var mem_road = $("#sample4_roadAddress").val();
				var mem_detail = $("#sample4_detailAddress").val();
				var mem_refer = $("#sample4_extraAddress").val();
				var mem_delname = $("#mem_delname").val();

				var param = {
					"mem_addr" : mem_addr,
					"mem_zipcode" : mem_zipcode,
					"mem_road" : mem_road,
					"mem_detail" : mem_detail,
					"mem_refer" : mem_refer,
					"mem_delname" : mem_delname

				}
				$.ajax({
					url : "${cpath}/my/insertDelivery.do",
					data : param,
					success : function(res) {
						//alert(res);
						window.opener.location.reload();
						window.close();
					}
				})// ajx 

			}) //// 배송지 입력
	$("#update").on(
			"click",
			function() {
				
		

				var mem_addr;

				if ($("#sample4_jibunAddress").val() == "") {
					mem_addr = $("#guide").text().substring(12,
							$("#guide").text().length - 1);
				} else {
					mem_addr = $("#sample4_jibunAddress").val();
				}

				var mem_zipcode = $("#sample4_postcode").val();
				var mem_road = $("#sample4_roadAddress").val();
				var mem_detail = $("#sample4_detailAddress").val();
				var mem_refer = $("#sample4_extraAddress").val();
				var mem_delname = $("#mem_delname").val();

				var param = {
					"mem_addr" : mem_addr,
					"mem_zipcode" : mem_zipcode,
					"mem_road" : mem_road,
					"mem_detail" : mem_detail,
					"mem_refer" : mem_refer,
					"mem_delname" : mem_delname
				}
				$.ajax({
					url : "${cpath}/my/updateDelivery.do",
					data : param,
					success : function(res) {
						//alert(res);
						window.opener.location.reload();
						window.close();
					}
				})// ajx  

			}) /// 배송지 수정
</script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>