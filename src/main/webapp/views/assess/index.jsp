<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="user" scope="request" type="com.ute.onlineauction.beans.User"/>
<jsp:useBean id="listuser" scope="request" type="java.util.List<com.ute.onlineauction.beans.User>"/>
<jsp:useBean id="score" scope="request" type="java.util.List<com.ute.onlineauction.beans.Score>"/>

<t:main>
    <jsp:body>
        <div class="card-body border border-dark">
            <c:set var="diem" value="${0}"> </c:set>
            <c:set var="allscore" value="${0}"> </c:set>
               <c:forEach items="${score}" var="s">
               <c:forEach items="${listuser}" var="u">
                   <c:if test="${s.userIDgive == u.id && s.userIDget == user.id}">
                       <c:choose>
                           <c:when test="${s.score==1}">
                               <p> ${u.name} <i class="fa fa-thumbs-up" aria-hidden="true"></i></p>
                               <c:set var="diem" value="${diem + 1}"> </c:set>
                               <c:set var="allscore" value="${allscore + 1}"> </c:set>
                           </c:when>
                           <c:otherwise>
                               <p>${u.name} <i class="fa fa-thumbs-down" aria-hidden="true"></i></p>
                               <c:set var="allscore" value="${allscore + 1}"> </c:set>
                           </c:otherwise>
                       </c:choose>
                       <p>${s.text}</p>
                   </c:if>
               </c:forEach>
               </c:forEach>
            <c:set  var="ketqua" value="${(diem / allscore)*100 }"> </c:set>
            <c:choose>
                <c:when test="${allscore != 0}">
                    <p>score: ${ketqua} %</p>
                </c:when>
                <c:otherwise>
                    <p>score: 100% </p>
                </c:otherwise>
            </c:choose>

        </div>
    </jsp:body>
</t:main>