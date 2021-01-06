<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../repeatingElements/header.jsp" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>

<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="cd-full-width">
            <div class="container-fluid js-tm-page-content" data-page-no="3" data-page-type="gallery">
                <div class="tm-img-gallery-container tm-img-gallery-container-2">
                    <div class="tm-img-gallery">
                        <div class="tm-img-gallery-info-container">
                            <h2 class="tm-text-title tm-gallery-title"><span class="tm-white" style="color: black">Przepisy</span>
                            </h2>
                        </div>
                        <c:forEach items="${recipes}" var="recipe">
                            <a href="/recipe/${recipe.id}">
                                <div class="grid-item">
                                    <figure class="effect-ruby">
                                        <img src="${recipe.imageURL}" alt="Image"
                                             class="img-fluid tm-img" style="width: 3000px;">
                                        <figcaption>
                                            <h3 class="tm-figure-title" style="font-size: 1.3em">${recipe.name}</h3>
                                        </figcaption>
                                    </figure>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>


<%@ include file="../repeatingElements/footer.jsp" %>

