<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div id=Tbody>
					<table class="display dataTable" id="example"
						aria-describedby="example_info">
						<thead>
							<tr role="row">
								<th scope="col" class="sorting_asc" role="columnheader"
									tabindex="0" aria-controls="example" rowspan="1" colspan="1"
									aria-sort="ascending"
									aria-label="Group Name: activate to sort column descending"
									style="width: 921px;">Group Name</th>
								<th scope="col" align="center" class="sorting_asc"
									role="columnheader" tabindex="0" aria-controls="example"
									rowspan="1" colspan="1"
									aria-label="Options: activate to sort column ascending"
									style="width: 97px;">Options</th>
							</tr>
						</thead>
						<c:forEach var="e" items="${grouplist}">
							<tbody role="alert" aria-live="polite" aria-relevant="all">
								<tr class="odd">

									<td width="80%" class=" sorting_1"><span
										style="float: left;"> </span> ${e.getGroupname()}</td>

									<td width="10%" align="center" class=" sorting_2"><a
										href="#" onclick="#"> <img src=" Users_files\edit.png"
											title="Edit">
									</a>&nbsp;<a
										href="groupnamedelete.spring?gname=${e.getGroupname()}"
										class="basicDelete" onclick="return doLevelDelete(1985);">
											<img src=" Users_files/delete.png" title="Delete">
									</a></td>
								</tr>
						</c:forEach>
						</tbody>
					</table>





					<div class="dataTables_info" id="example_info">
						Showing 1 to 5 of <b> ${param.pageNo} </b>entries
						<div style="position: absolute; top: left: 500px;">
							<h6>
								<a href="users.spring?operation=first">First</a> | &nbsp;
								<%--For displaying Previous link except for the 1st page --%>
								<c:if test="${param.pageNo> 1}">

									<td><a href="users.spring?pageNo=${param.pageNo-1}">Previous
											&nbsp;</a></td>
								</c:if>

								<c:forEach begin="1" end="${i}" var="j">
									<c:choose>
										<c:when test="${param.pageNo eq j}">
											<td>${j}</td>
										</c:when>
										<c:otherwise>
											<a href="users.spring?pageNo=${j}">${j} </a>&nbsp; 
									</c:otherwise>
									</c:choose>
								</c:forEach>

								<%--For displaying Next link --%>

								<c:if test="${param.pageNo lt i}">
									<td><a href="users.spring?pageNo=${param.pageNo+1}">Next
											&nbsp; </a></td>
								</c:if>

								| &nbsp;<a href="users.spring?operation=last">Last</a>
							</h6>
						</div>


					</div>
					<div class="dataTables_paginate paging_two_button"
						id="example_paginate">
						<a class="paginate_disabled_previous" tabindex="0" role="button"
							id="example_previous" aria-controls="example"></a><a
							class="paginate_disabled_next" tabindex="0" role="button"
							id="example_next" aria-controls="example"></a>
					</div>
				</div>
	
</body>
</html>