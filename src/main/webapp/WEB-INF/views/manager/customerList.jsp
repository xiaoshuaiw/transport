<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<jsp:include page="../commons/header.jsp"></jsp:include>
	</head>

	<body class="no-skin">
	    <!-- 导航栏 start		-->
	     <jsp:include page="../commons/navbar.jsp"></jsp:include>
		<!-- 导航栏 end -->

		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
				try{ace.settings.loadState('main-container')}catch(e){}
			</script>
            <!--- 左边栏-菜单 start -->
			  <jsp:include page="../commons/sidebar.jsp"></jsp:include>
			<!--- 左边栏-菜单 end -->

			<!--- 内容主体 start -->
			<div class="main-content">
				<div class="main-content-inner">
				    <!-- 向导栏 start-->
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
								<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">首页</a>
							</li>

							<li>
								<a href="#">客户管理</a>
							</li>
							<li class="active">客户-列表</li>
						</ul><!-- /.breadcrumb -->

						
					</div>
					<!-- 向导栏 end-->

					<!-- 内容页 start -->
					<div class="page-content">
				          			<div class="widget-box transparent" id="widget-box-13">
												<div class="widget-header">
													<h4 class="widget-title lighter">客户管理</h4>

													<div class="widget-toolbar no-border">
														<ul class="nav nav-tabs" id="myTab2">
															<li >
																<a data-toggle="tab" href="javascript:void(0)" onclick="window.location.href='${pageContext.request.contextPath }/customer/toCustomerAdd.do'">增加</a>
															</li>

													

															<li class="active">
																<a data-toggle="tab" href="#customerList">列表</a>
															</li>
														</ul>
													</div>
												</div>

												<div class="widget-body">
													<div class="widget-main padding-12 no-padding-left no-padding-right">
														<div class="tab-content padding-4">
															

													        
															<div id="customerList" class="tab-pane in active">
															<form id="from1" class="form-search" action="${pageContext.request.contextPath }/customer/toCustomerSearch.do" method="post">
																<div class="nav-search" >
																		编号：<span class="input-icon">
																		<input name="customer_id" type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
																		姓名：<input name="customer_name" type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
																		手机号：<input name="customer_phone" type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
																			<!-- <i class="ace-icon fa fa-search nav-search-icon"></i> -->
																			 <button class="nav-search-input" type="submit" style="width: 60px">查询</button>
																		</span>
								
																</div>
															</form>
															<button id="btnDeleteChkCustomer" class="btn btn-primary">删除勾选用户</button>
															     
																 <table class="table table-striped table-bordered align-center "> 
																    <tr class="bolder" >
																	  <td><input id="chkAllCustomer" type="checkbox"></td>
																	  <td>编号</td>
																	  <td>客户姓名</td>
																	  <td>客户电话</td>
																	  <td>通讯地址</td>
																	  <td>客户性别</td>
																	  <td>客户身份证号</td>
																	  <td>备注</td>
																	  <td>操作</td>
																	</tr>
														
															      <c:forEach var="customer" varStatus="status" items="${requestScope.page.data }">
																    <tr>
																	  <td><input name="customerId" value="${customer.customer_id}" type="checkbox"></td>
																	  <td>${customer.customer_id}</td>
																	  <td>${customer.customer_name}</td>
																	  <td>${customer.customer_phone}</td>
																	  <td>${customer.customer_address}</td>
																	  <td>${customer.customer_gender}</td>
																	  <td>${customer.customer_identity}</td>
																	  <td>${customer.customer_remark}</td>
																	   <td><button class="btn btn-sm btn-primary" onclick="window.location.href='${pageContext.request.contextPath }/customer/toCustomerEdit.do?customerId=${customer.customer_id}'">更新</button>&nbsp;&nbsp;<button class="btn btn-sm btn-primary" onclick="window.location.href='${pageContext.request.contextPath }/customer/deleteCustomer.do?customerId=${customer.customer_id}'" >删除</button></td>
																	</tr>
																   <tr>
																   </c:forEach>
															
																 </table>
																 <div class="text-right">
																	<nav>
																	  <ul class="pagination">
									
																	      <c:choose>
																	         <c:when test="${requestScope.page.previous==true }">
																	             <li>
																	               <a href="${pageContext.request.contextPath }/customer/toCustomerList.do?index=${requestScope.page.index-1}" aria-label="Previous">
																	       			 <span aria-hidden="true">&laquo;</span>
																	      			</a>
																	      		 </li>
																	         </c:when>
																	         <c:otherwise>
																	             <li class="disabled">
																		            <a href="#" aria-label="Previous">
																		       			 <span aria-hidden="true">&laquo;</span>
																		      		 </a>
																	      		 </li>
																	         </c:otherwise>
																	      </c:choose>

																	    <c:forEach begin="1" varStatus="status" end="${requestScope.page.pageNum }">
																	       <c:choose>
																	          <%--需求：选中当前页
																	            	思路：如果 status.count=index+1 选中
																	           --%>
																	          <c:when test="${status.count==requestScope.page.index+1}">
							                                                         <%-- 注意事项：数据库的索引是从0开始的，而页面索引是从1开始的。索引数据索引=页面索引-1 --%>
																	      			<li class="active">
																	      			<a href="${pageContext.request.contextPath }/customer/toCustomerList.do?index=${status.count-1}">${status.count }</a>
																	      			</li>										          
																	          </c:when>
																	          <c:otherwise>
																	                <li>
																	                <a href="${pageContext.request.contextPath }/customer/toCustomerList.do?index=${status.count-1}">${status.count }</a>
																	                </li>
																	          </c:otherwise>
																	       </c:choose>
																	    </c:forEach>
																	    
																	    <c:choose>
																	      <c:when test="${requestScope.page.next==true }">
																           <li>
																	      	  <a href="${pageContext.request.contextPath }/customer/toCustomerList.do?index=${requestScope.page.index+1}" 
																	      	      aria-label="Next">
																	        	<span aria-hidden="true">&raquo;</span>
																	      	  </a>
																	    	</li>
																	      </c:when>
																	      <c:otherwise>
																	         <li class="disabled">
																	      		<a href="#" aria-label="Next">
																	        	<span aria-hidden="true">&raquo;</span>
																	      		</a>
																	    	</li>
																	      </c:otherwise>
																	  
																	    </c:choose>
																	  </ul>
																	</nav>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
					</div><!-- /.page-content -->
					<!-- 内容页 end -->
				</div>
			</div><!-- /.main-content -->
			<!--- 内容主体 end -->

			 <!--页尾 start -->
		 <jsp:include page="../commons/footer.jsp"></jsp:include>
		
			 <!--页尾 end -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->
		<script src="${pageContext.request.contextPath}/lib/ace-admin/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="${pageContext.request.contextPath}/lib/ace-admin/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='${pageContext.request.contextPath}/lib/ace-customer/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${pageContext.request.contextPath}/lib/ace-admin/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->
	
		<!-- ace scripts -->
		<script src="${pageContext.request.contextPath}/lib/ace-admin/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath}/lib/ace-admin/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->
		<script type="text/javascript">
		       $("#chkAllCustomer").click(function(){
		    	   // alert("-test-"+$(this).prop("checked"));
		    	   //1.当前点击是复选框选中，其他的复选框也选中，
		    	   
		    	   if($(this).prop("checked")==true){
		    		   //注意：attr与prop的区别，attr只能获得或者设置一个对象的值，而prop可以设置或者获得一组对象的值
		    		   $("input[name='customerId']").prop("checked",true);
		    	   }else{
		    		   $("input[name='customerId']").prop("checked",false);
		    	   }
		    	});
		      
		       $("#btnDeleteChkCustomer").click(function(){
		    	   //alert("--test--");
		    	   //1.获得选中的复选框的值
		    	   var chkCustomers= $("input[name='customerId']:checked");
		    	   var params=chkCustomers.serialize();
		    	   //2.将chkCustomer转换成发送的参数
		    	   window.location.href="${pageContext.request.contextPath }/customer/deleteCustomers.do?"+params;
		       });
		       
		</script>
	</body>
</html>
