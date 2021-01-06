<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../repeatingElements/header.jsp" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="cd-full-width">
            <div class="container-fluid js-tm-page-content tm-page-width" data-page-no="5">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="tm-flex">
                            <div class="tm-bg-white-translucent text-xs-left tm-textbox tm-textbox-padding tm-white-box-margin-b">
                                <h3 class="card-title" style="font-size: 25px;">${shoppingList.name}</h3>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th scope="col">Produkt</th>
                                        <th scope="col">Ilość</th>
                                        <th scope="col"><a href="/user/list/${shoppingList.id}/product/deleteAll"
                                                           class="fa fa-trash-o"
                                                           style="color: red; font-size: 20px"></a></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${shoppingList.productsList}" var="product">
                                        <tr>
                                            <td>${product.name}</td>
                                            <td>${product.quantity} ${product.unit}</td>
                                            <td><a href="/user/list/${shoppingList.id}/product/delete/${product.id}"
                                                   class="fa fa-remove"></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tr>
                                        <form:form action="/user/list/${shoppingList.id}/product/add" method="post"
                                                   modelAttribute="product">
                                            <td>
                                                <form:input path="name" placeholder="nazwa"/>
                                                <form:errors path="name"/>
                                            </td>
                                            <td>
                                                <form:input path="quantity" placeholder="ilość"/>
                                                <form:errors path="quantity"/>
                                                <input type="submit" class="btn btn-info" style="font-size: 20px"
                                                       value="Zapisz">
                                            </td>
                                        </form:form>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>
<%@ include file="../repeatingElements/footer.jsp" %>

