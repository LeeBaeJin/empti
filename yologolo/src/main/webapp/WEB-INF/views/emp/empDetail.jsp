<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2 align="center">사원 상세 보기</h2>
	<img src="download?name=${getEmp.profile}" 
	style="width:500px" onerror="this.src='resources/images/profile.jpg'"/> <br/>
	<label>사원번호: </label> &nbsp; &nbsp; <span>${getEmp.emp_id}</span> <br/>
	<label>사원이름: </label> &nbsp; &nbsp; <span>${getEmp.name}</span> <br/>
	<label>전화번호: </label> &nbsp; &nbsp; <span>${getEmp.phone}</span> <br/>
	<label>주소: </label> &nbsp; &nbsp; <span>${getEmp.address}</span> <br/>
	<label>이메일: </label> &nbsp; &nbsp; <span>${getEmp.email}</span> <br/>
	<label>입사일: </label> &nbsp; &nbsp; <span>${getEmp.hire_date}</span> <br/>
	<label>급여: </label> &nbsp; &nbsp; <span>${getEmp.salary}</span> <br/>
	<label>계약유형: </label> &nbsp; &nbsp; <span>${getEmp.position}</span> <br/>
	<label>상태: </label> &nbsp; &nbsp; <span>${getEmp.status}</span> <br/>
	<label>은행명: </label> &nbsp; &nbsp; <span>${getEmp.bank_name}</span> <br/>
	<label>계좌번호: </label> &nbsp; &nbsp; <span>${getEmp.account_no}</span> <br/>
	<label>부서아이디: </label> &nbsp; &nbsp; <span>${getEmp.dept_id}</span> <br/>
	<label>매니저아이디: </label> &nbsp; &nbsp; <span>${getEmp.mgr_id}</span> <br/>
