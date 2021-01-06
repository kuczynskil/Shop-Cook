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
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${shoppingList.productsList}" var="product">
                                        <tr>
                                            <td>${product.name}</td>
                                            <td>${product.quantity}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
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

