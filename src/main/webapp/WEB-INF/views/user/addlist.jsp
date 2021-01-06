<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../repeatingElements/header.jsp" %>
<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="text-xs-center" style="margin: 0;
  position: absolute;
  top: 30%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);">
            <div class="main">
                <form:form modelAttribute="shoppingList">
                    <form:input path="name" placeholder="nazwa planu" default="nowy plan"/>
                    <form:errors path="name"/>
                    <input type="submit" value="Zapisz">
                </form:form>
            </div>
        </div>
    </li>
</ul>

<%@ include file="../repeatingElements/footer.jsp" %>

