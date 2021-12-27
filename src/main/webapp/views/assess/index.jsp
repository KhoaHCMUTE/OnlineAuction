<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="AuthUser" scope="session" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="user" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="assess" scope="request" type="java.util.List<com.ute.onlineauction.beans.Assess>"/>

<t:main>
    <jsp:body>
        <div class="card-body border border-dark">
               <c:forEach items="${assess}" var="a">
               <c:forEach items="${user}" var="u">
                   <c:if test="${a.assessorID == u.id}">
                       <c:choose>
                           <c:when test="${a.type==1}">
                               <p> ${u.userName} (good)</p>
                           </c:when>
                           <c:otherwise>
                               <p>${u.userName} (bad)</p>
                           </c:otherwise>
                       </c:choose>
                       <p>${a.comment}</p>
                   </c:if>
               </c:forEach>
               </c:forEach>
        </div>
    </jsp:body>
</t:main>