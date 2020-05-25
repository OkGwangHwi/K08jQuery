<%@page import="org.json.simple.JSONObject"%>
<%@page import="controller.OracleDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 03PostLoginOracle.jsp --%>
<%
//폼값을 받음
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

OracleDAO dao = new OracleDAO();
boolean isMember= dao.isMember(id, pw);
//jsp에서 JSON을 사용하기 위해 확장라이브러리 설치후 객체를 생성한다.
JSONObject json = new JSONObject(); 

if(isMember==true){

	json.put("result",1);
	json.put("message","로그인 성공입니다.^^");
	
	String html = "";
	html+="<table class='table table-bordered' style='width:300px;'>";
	html+="	<tr>";
	html+="		<td>회원님,반갑습니다^^</td>";
	html+="	</tr>";
	html+="</table>";
	
	json.put("html",html);
}
else{
	//아이디,패스워드가 일치하지 않는경우 result를 0으로 반환한다.
	json.put("result",0);
	json.put("message","로그인 실패입니다.ㅠㅠ");
}
//JSON객체를 String 타입으로 형변환 후 화면에 내용을 출력한다.
String jsonStr = json.toJSONString();
out.println(jsonStr);
%>