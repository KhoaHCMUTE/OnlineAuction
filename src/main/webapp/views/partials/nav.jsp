        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>


        <nav class="navbar navbar-expand-lg navbar-light bg-light shadow border border-dark ">
        <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home/index">
           <i class="fa fa-shopping-bag fa-2x" aria-hidden="true"></i>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
           <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
           <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home/index"><b>Online Auction</b></a>
           </li>
           <c:if test="${AuthUser.permission == 1}">
              <li class="nav-item ">
                 <a class="nav-link active text-primary " aria-current="page"
                    href="${pageContext.request.contextPath}/account/admin"><b>Admin</b></a>
              </li>
           </c:if>
        </ul>
        <form id="flogout" method="post" action="${pageContext.request.contextPath}/account/logout"></form>
        <form method="post" class="form-inline mt-2 mr-4 mb-4 ml-auto">
        <c:choose>
            <c:when test="${Auth}">
                <a id="" class="btn btn-outline-success " href="${pageContext.request.contextPath}/admin/product/Notify?UserID=${AuthUser.id}" role="button">
                    <i class="fa fa-bell" aria-hidden="true"></i>
                </a>
                <b>&nbsp;</b>
            </c:when>
            <c:otherwise>
                <b>&nbsp;</b>
            </c:otherwise>
        </c:choose>

              <input id="txtSr" class="form-control mr-sm-2" type="text" placeholder="Search" name="txtSr">
              <button onclick="SearchFunction()" class="btn btn-outl ine-success my-2 my-sm-0" type="button"><i
                      class="fa fa-search" aria-hidden="true"></i>&nbsp;Search</button>
              <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
              <c:choose>
                 <c:when test="${Auth}">
                       <li class="nav-item dropdown">
                          <a class="nav-link dropdown-toggle" href="#" id="navDrop" role="button" data-toggle="dropdown">
                             <b>${AuthUser.name}</b>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navDrop">
                             <a class="dropdown-item" href="${pageContext.request.contextPath}/account/profile">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                Profile
                             </a>
                             <div class="dropdown-divider"></div>

                              <a class="dropdown-item" href="javascript: $('#flogout').submit()">
                                  <i class="fa fa-sign-out" aria-hidden="true"></i>
                                  Logout
                              </a>

                          </div>
                       </li>
                 </c:when>
                 <c:otherwise>
                    <li class="nav-item">
                       <a class="nav-link active" style="font-weight: bold" aria-current="page"
                          href="${pageContext.request.contextPath}/account/register">Register</a>
                    </li>
                    <li class="nav-item">
                       <a class="nav-link active" style="font-weight: bold" aria-current="page"
                          href="${pageContext.request.contextPath}/account/login">Login</a>
                    </li>
                 </c:otherwise>
              </c:choose>
              </ul>
              </form>
              </div>
              </div>
              </nav>
              <script>
              function SearchFunction(){
              let txtSr = document.getElementById("txtSr").value;
              window.location.href="${pageContext.request.contextPath}/admin/product/ProSearch?txtSr="+txtSr;
              }
              </script>

