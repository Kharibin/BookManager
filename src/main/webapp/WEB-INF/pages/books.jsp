<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Books Page</title>

    <style type="text/css">
        body {
            background-color: #f0f0f0;
        }

        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 10px;
            padding: 7px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 10px;
            font-weight: normal;
            padding: 7px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #f0f0f0;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }

        .pagination {
            font-size: 14px;
            boreder-style: solid;
            border-width: 1px;
            background-color: #f9f9f9;
            color: #333333;
            alignment: center;
            width: 200px;
        }

        #searchButton {
            width: 200px;
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br>
<br>
<br/>


<form action="/books/">
    <label for="id">ID:</label>
    <input type="number" id="id" name="id" placeholder="search by id"/>
    <br/>
    <br/>
    <input type="submit" value="Search by id" id="searchButton"/>
</form>

<div align="center">
    <h2>Book List</h2>

    <c:if test="${!empty listBooks}">
        <table class="tg" align="center">
            <tr>
                <th width="80">ID</th>
                <th width="120">Title</th>
                <th width="120">Description</th>
                <th width="120">Author</th>
                <th width="120">ISBN</th>
                <th width="120">Year</th>
                <th width="120">is Read?</th>
                <th width="60">Edit</th>
                <th width="60">Set Read</th>
                <th width="60">Delete</th>
            </tr>
            <c:forEach items="${listBooks}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td><a href="/bookdata/${book.id}" target="_blank">${book.title}</a></td>
                    <td>${book.description}</td>
                    <td>${book.author}</td>
                    <td>${book.isbn}</td>
                    <td>${book.printYear}</td>
                    <td>${book.read}</td>
                    <td><a href="<c:url value='/edit/${book.id}'/>">Edit</a></td>
                    <td><a href="<c:url value='/setRead/${book.id}'/>">Set Read</a></td>
                    <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <div class="pagination">
        <c:forEach begin="${startpage}" end="${endpage}" var="p"><a
                href="<c:url value="/books" ><c:param name="page" value="${p}"/>${p}</c:url>">${p}</a></c:forEach>

    </div>


    <h2>Add or edit Book</h2>

    <c:url var="addAction" value="/books/add"/>

    <form:form action="${addAction}" commandName="book">
        <table align="center">
            <c:if test="${!empty book.title}">
                <tr>
                    <td>
                        <form:label path="id">
                            <spring:message text="ID"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="id" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="id"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="title">
                        <spring:message text="Title"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="title"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="description">
                        <spring:message text="Description"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="description"/>
                </td>
            </tr>
            <c:if test="${!empty book.title}">
                <tr>
                    <td>
                        <form:label path="author">
                            <spring:message text="Author"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="author" readonly="true" size="8" disabled="true"/>
                        <form:hidden path="author"/>
                    </td>
                </tr>
            </c:if>
            <c:if test="${empty book.title}">
                <tr>
                    <td>
                        <form:label path="author">
                            <spring:message text="Author"/>
                        </form:label>
                    </td>
                    <td>
                        <form:input path="author"/>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <form:label path="isbn">
                        <spring:message text="ISBN"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="isbn"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="printYear">
                        <spring:message text="Year"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="printYear"/>
                </td>
            </tr>
        </table>
        <div align="center">
            <c:if test="${!empty book.title}">
                <input type="submit"
                       value="<spring:message text="Edit Book"/>"/>
            </c:if>
            <c:if test="${empty book.title}">
                <input type="submit"
                       value="<spring:message text="Add Book"/>"/>
            </c:if>
        </div>
    </form:form>
</div>
</body>
</html>
