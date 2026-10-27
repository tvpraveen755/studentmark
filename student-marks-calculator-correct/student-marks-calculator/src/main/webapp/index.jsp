<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
    private String escapeHtml(String value) {
        if (value == null) return "";
        return value.replace("&", "&amp;")
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
    <title>Student Marks Calculator</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f1f5f9; padding: 30px; }
        .container { max-width: 550px; margin: auto; padding: 25px; background: white; border-radius: 10px; }
        label { display: block; margin-top: 15px; font-weight: bold; }
        input { width: 100%; padding: 10px; margin-top: 6px; box-sizing: border-box; }
        button { margin-top: 20px; padding: 12px; width: 100%; background: #1d4ed8; color: white; border: 0; cursor: pointer; }
        .error { color: #b91c1c; background: #fee2e2; padding: 10px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Marks Calculator</h1>

    <% if (request.getAttribute("errorMessage") != null) { %>
        <p class="error">
            <%= escapeHtml(String.valueOf(request.getAttribute("errorMessage"))) %>
        </p>
    <% } %>

    <form action="<%= request.getContextPath() %>/result" method="post">
        <label for="studentName">Student Name</label>
        <input type="text" id="studentName" name="studentName" required maxlength="100"
               value="<%= escapeHtml(request.getParameter("studentName")) %>">

        <label for="subject1">Subject 1 Marks</label>
        <input type="number" id="subject1" name="subject1" min="0" max="100" step="1" required
               value="<%= escapeHtml(request.getParameter("subject1")) %>">

        <label for="subject2">Subject 2 Marks</label>
        <input type="number" id="subject2" name="subject2" min="0" max="100" step="1" required
               value="<%= escapeHtml(request.getParameter("subject2")) %>">

        <label for="subject3">Subject 3 Marks</label>
        <input type="number" id="subject3" name="subject3" min="0" max="100" step="1" required
               value="<%= escapeHtml(request.getParameter("subject3")) %>">

        <button type="submit">Calculate Result</button>
    </form>
</div>
</body>
</html>