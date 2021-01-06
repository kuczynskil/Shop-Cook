<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../repeatingElements/header.jsp" %>

<ul class="cd-hero-slider">
    <li class="selected" style="background-image: url('/img/FF048SNS_main.jpeg')">
        <div class="cd-full-width">
            <div class="container-fluid tm-page-width" data-page-no="5">
                <div class="row">
                    <div class="tm-bg-white-translucent text-xs-left tm-textbox tm-textbox-padding tm-white-box-margin-b">
                        <table class="table table-hover">
                            <tbody>
                            <c:forEach items="${shoppingLists}" var="list">
                                <tr>
                                    <th>
                                        <a href="/user/list/edit/${list.id}">${list.name}</a>
                                    </th>
                                    <td class="text-xs-center"><a href="/user/list/delete/${list.id}"
                                                                  class="fa fa-trash-o" style="color:red"></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <a href="addlist" class="btn btn-info" style="font-size: 20px">Dodaj nową listę zakupów</a>
                    </div>
                </div>
            </div>
        </div>
    </li>
</ul>
<%@ include file="../repeatingElements/footer.jsp" %>

