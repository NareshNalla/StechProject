<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/style_blue.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="css/feedback.css" type="text/css"
	media="screen">
</head>
<body>
	<div id=Tbody>
		<table class="display dataTable" id="example" aria-describedby="example_info">
			<thead>
				<tr role="row">
					<th class="sorting_asc" role="columnheader" tabindex="0"
						aria-controls="example" rowspan="1" colspan="1"
						style="width: 100px;" aria-sort="ascending"
						aria-label="User Id: activate to sort column descending">
						Email</th>

					<th class="sorting_asc" role="columnheader" tabindex="0"
						aria-controls="example" rowspan="1" colspan="1"
						style="width: 100px;"
						aria-label="Email: activate to sort column ascending">User
						Group</th>
					<th class="sorting" role="columnheader" tabindex="0"
						aria-controls="example" rowspan="1" colspan="1"
						style="width: 400px;"
						aria-label="View Profile: activate to sort column ascending">
						View Profile</th>
					<th class="sorting" role="columnheader" tabindex="0"
						aria-controls="example" rowspan="1" colspan="1"
						style="width: 100px;"
						aria-label="Options: activate to sort column ascending">
						Options</th>
				</tr>
			</thead>

			<tfoot>
			</tfoot>
			<tbody role="alert" aria-live="polite" aria-relevant="all">
				<tr class="odd">
					<c:forEach var="e" items="${ugrouplist}">
						<tbody role="alert" aria-live="polite" aria-relevant="all">
							<tr class="odd">
								<td width="80%" class=" sorting_1"><span
									style="float: left;"> </span> ${e.getEmail()}</td>

								<td width="80%" class=" sorting_1"><span
									style="float: left;"> </span> ${e.getGroupnamef()}</td>


								<td class=" "><a href="http://www. .com/a/ViewUser.do#"
									onclick="getProfile(&#39;${e.getUser_id()}&#39;);"><img
										src="./user_List_files/user.png" alt="View Profile"
										title="View Profile"></a> &nbsp;&nbsp; <a
									href="javaScript:resetPassword('11493','jai.mail67@gmail.com')"
									title="Reset Password">Reset Password</a> <!-- <img src="< %=request.getContextPath()%>/images/edit.png" /> -->
								</td>

								<td id="delete" class="delete"><a
									href="userdelete.spring?uid=${e.getUser_id()}"
									onclick="return doUserDelete(&#39;${e.getEmail()}&#39;);"><img
										src="Users_files/delete.png" title="Delete"></a></td>
							</tr>
						</tbody>
					</c:forEach>
		</table>


		<div class="dataTables_info" id="example_info">
			Showing 1 to 5 of <b> ${param.pageNo} </b>entries
			<div style="position: absolute; top: left: 500px;">
				<h6>
					&nbsp;
					<%--For displaying Previous link except for the 1st page --%>
					<c:if test="${param.pageNo> 1}">

						<td><a href="userlist.spring?pageNo=${param.pageNo-1}">Previous
								&nbsp;</a></td>
					</c:if>

					<c:forEach begin="1" end="${ui}" var="j">
						<c:choose>
							<c:when test="${param.pageNo eq j}">
								<td>${j}</td>
							</c:when>
							<c:otherwise>
								<a href="userlist.spring?pageNo=${j}">${j} </a>&nbsp; 
									</c:otherwise>
						</c:choose>
					</c:forEach>

					<%--For displaying Next link --%>

					<c:if test="${param.pageNo lt ui}">
						<td><a href="userlist.spring?pageNo=${param.pageNo+1}">Next
								&nbsp; </a></td>
					</c:if>


				</h6>
			</div>
		</div>


	</div>

</body>
</html>