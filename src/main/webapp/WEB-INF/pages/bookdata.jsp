<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>
<head>
  <title>BookData</title>

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
<div align="center">
<h1>Book Details</h1>

<table class="tg">
  <tr>
    <th width="80">ID</th>
    <th width="120">Title</th>
    <th width="120">Description</th>
    <th width="120">Author</th>
    <th width="120">ISBN</th>
    <th width="120">Year</th>
    <th width="120">is Read?</th>
  </tr>
  <tr>
  <td>${book.id}</td>
  <td>${book.title}</td>
  <td>${book.description}</td>
  <td>${book.author}</td>
  <td>${book.isbn}</td>
  <td>${book.printYear}</td>
  <td>${book.read}</td>
  </tr>
</table>
</div>
</body>
</html>