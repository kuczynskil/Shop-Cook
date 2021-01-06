<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../repeatingElements/header.jsp" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="cd-full-width">
            <div class="container-fluid js-tm-page-content tm-page-width" data-page-no="5">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="tm-flex">
                            <div class="tm-bg-white-translucent text-xs-left tm-textbox tm-textbox-padding tm-white-box-margin-b">
                                <h2 style="color:black">${recipe.name}</h2>
                                <div class="row">
                                    <div class="col-11 col-lg-7">
                                        <!-- Single Preparation Step -->
                                        <div class="single-preparation-step d-flex">
                                            <h3>Przygotowanie:</h3>
                                            <p>${recipe.preparation}</p>
                                        </div>
                                    </div>

                                    <!-- Ingredients -->
                                    <div class="col-11 col-lg-5">
                                        <div class="ingredients">
                                            <h3>Składniki:</h3>
                                            <c:forEach items="${ingredients}" var="ingredient">
                                                <div class="custom-control custom-checkbox">
                                                    <i class="fa fa-circle-thin" style="font-size: 12px;"></i>
                                                    <label class="custom-control-label"
                                                    >${ingredient.quantity} ${ingredient.unit} ${ingredient.name}</label>
                                                </div>
                                            </c:forEach>
                                            <sec:authorize access="isAuthenticated()">
                                                <form:form>
                                                    <input type="submit" class="btn btn-info" style="font-size: 20px"
                                                           value="Dodaj do nowej listy zakupów">
                                                </form:form>
                                            </sec:authorize>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>


<%@ include file="../repeatingElements/footer.jsp" %>

