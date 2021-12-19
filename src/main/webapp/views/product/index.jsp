<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="product" scope="request" type="java.util.List<com.ute.onlineauction.beans.Product>"/>
<t:main>
    <jsp:body>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Product</th>
                    <th scope="col">TinyDes</th>
                    <th scope="col">FullDes</th>
                    <th scope="col">Price</th>
                    <th scope="col">PriceDifference</th>
                    <th scope="col">CatID</th>
                    <th scope="col">PerID</th>
                    <th scope="col">
                        <a  id="" class="btn btn-sm btn-outline-success" href="${pageContext.request.contextPath}/admin/product/add" role="button">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                            Add Product
                        </a>
                    </th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${product}" var="p">
                    <tr>
                        <th scope="row">${p.proID}</th>
                        <td>${p.proName}</td>
                        <td>${p.tinyDes}</td>
                        <td>${p.fullDes}</td>
                        <td><fmt:formatNumber value="${p.price}" type="number"/></td>
                        <td>${p.priceDifference}</td>
                        <td>${p.catID}</td>
                        <td>${p.perID}</td>
                        <td>
                            <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/admin/product/edit?id=${p.proID}" role="button">
                                <i class="fa fa-pencil" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </jsp:body>
</t:main>