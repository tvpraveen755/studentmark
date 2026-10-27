<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(Object value) {
        if (value == null) return "";
        return value.toString()
                    .replace("&", "&amp;")
                    .replace("<", "&lt;")
                    .replace(">", "&gt;")
                    .replace("\"", "&quot;")
                    .replace("'", "&#39;");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f1f5f9;
            padding: 30px;
        }
        .container {
            max-width: 550px;
            margin: auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
        }
        .result {
            background: #f8fafc;
            padding: 15px;
            line-height: 2;
            border-radius: 8px;
        }
        .grade {
            font-size: 24px;
            font-weight: bold;
            color: #15803d;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px;
            background: #1d4ed8;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Result</h1>

    <div class="result">
        <strong>Student Name:</strong>
        <%= escapeHtml(request.getAttribute("studentName")) %>
        <br>

        <strong>Subject 1:</strong>
        <%= escapeHtml(request.getAttribute("mark1")) %> / 100
        <br>

        <strong>Subject 2:</strong>
        <%= escapeHtml(request.getAttribute("mark2")) %> / 100
        <br>

        <strong>Subject 3:</strong>
        <%= escapeHtml(request.getAttribute("mark3")) %> / 100
        <br>

        <strong>Total Marks:</strong>
        <%= escapeHtml(request.getAttribute("total")) %> / 300
        <br>

        <strong>Average Marks:</strong>
        <%= escapeHtml(request.getAttribute("average")) %>
        <br>

        <strong>Final Grade:</strong>
        <span class="grade">
            <%= escapeHtml(request.getAttribute("grade")) %>
        </span>
    </div>

    <a href="<%= request.getContextPath() %>/">
        Enter Another Result
    </a>
</div>
</body>
</html>