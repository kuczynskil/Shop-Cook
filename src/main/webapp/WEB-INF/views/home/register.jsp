<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../repeatingElements/header.jsp" %>

<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="text-xs-center" style="margin: 0;
  position: absolute;
  top: 40%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);">
            <form:form modelAttribute="appUser">
                <div class="form-group">
                    <label>
                        Imię <form:input path="name" class="form-control"/>
                        <form:errors path="name"/>
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        Email <form:input path="email" type="email" class="form-control"/>
                        <form:errors path="email"/>
                        <small id="emailHelp" class="form-text text-muted">Nigdy nie udostępnimy Twojego adresu
                            email.</small>
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        Hasło <form:input path="password" type="password" class="form-control"/>
                        <small class="form-text text-muted">Hasło musi zawierać: małą i wielką literę oraz
                            cyfrę.</small>
                    </label>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-info"
                            style="font-size: 20px">Zarejestruj się</button>
                </div>
            </form:form>
        </div>
    </li>
</ul>


<%@ include file="../repeatingElements/footer.jsp" %>

