package com.example;

import java.io.IOException;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/result")
public class StudentMarksServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("studentName");
        if (name == null || name.trim().isEmpty()) {
            showError(request, response, "Please enter the student's name.");
            return;
        }
        name = name.trim();

        String[] submittedMarks = {
            request.getParameter("subject1"),
            request.getParameter("subject2"),
            request.getParameter("subject3")
        };

        int[] marks = new int[3];
        for (int i = 0; i < submittedMarks.length; i++) {
            String value = submittedMarks[i];
            if (value == null || value.trim().isEmpty()) {
                showError(request, response, "Please enter marks for all three subjects.");
                return;
            }

            try {
                marks[i] = Integer.parseInt(value.trim());
            } catch (NumberFormatException ex) {
                showError(request, response, "Marks must be whole numbers between 0 and 100.");
                return;
            }

            if (marks[i] < 0 || marks[i] > 100) {
                showError(request, response, "Each subject's marks must be between 0 and 100.");
                return;
            }
        }

        int total = marks[0] + marks[1] + marks[2];
        double average = total / 3.0;
        String grade;

        if (average >= 90) {
            grade = "A";
        } else if (average >= 75) {
            grade = "B";
        } else if (average >= 60) {
            grade = "C";
        } else if (average >= 40) {
            grade = "D";
        } else {
            grade = "Fail";
        }

        request.setAttribute("studentName", name);
        request.setAttribute("mark1", marks[0]);
        request.setAttribute("mark2", marks[1]);
        request.setAttribute("mark3", marks[2]);
        request.setAttribute("total", total);
        request.setAttribute("average", String.format(Locale.US, "%.2f", average));
        request.setAttribute("grade", grade);

        request.getRequestDispatcher("/result.jsp").forward(request, response);
    }

    private void showError(HttpServletRequest request,
                           HttpServletResponse response,
                           String message)
            throws ServletException, IOException {
        request.setAttribute("errorMessage", message);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}
