<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@ include file="../repeatingElements/header.jsp" %>

<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="text-xs-center" style="margin: 0;
  position: absolute;
  top: 40%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);">
            <form method="post">
                <div class="form-group">
                    <label>
                        Email <input name="username" type="email" class="form-control"/>
                    </label>
                </div>
                <div class="form-group">
                    <label>
                        Hasło <input name="password" type="password" class="form-control"/>
                    </label>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-info" style="font-size: 20px">Zaloguj się</button>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>
            <br>
            <h3>Nie masz konta?</h3><br>
            <a href="${pageContext.request.contextPath}/register" class="btn btn-info"
               style="font-size: 20px">Rejestracja</a>
        </div>
    </li>
</ul>

<%@ include file="../repeatingElements/footer.jsp" %>
