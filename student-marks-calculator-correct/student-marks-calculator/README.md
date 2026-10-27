# Student Marks Calculator - Java Servlet

A Maven web application that accepts a student's name and marks in three subjects, validates input on the server, calculates total and average marks, assigns a grade, and displays results on a separate JSP page.

## Requirements
- JDK 11 or later
- Maven 3.8 or later
- Apache Tomcat 9.x
- Eclipse IDE for Enterprise Java and Web Developers (optional)

This project uses `javax.servlet` and is intended for Tomcat 9. For Tomcat 10+, change imports/dependency to `jakarta.servlet`.

## Project structure
- `src/main/java/com/example/StudentMarksServlet.java`
- `src/main/webapp/index.jsp`
- `src/main/webapp/result.jsp`
- `pom.xml`

## Build with Maven
From the folder containing `pom.xml`, run:

```bash
mvn clean package
```

The generated WAR is `target/student-marks-calculator.war`.

## Run on Tomcat
Copy `target/student-marks-calculator.war` to Tomcat's `webapps` directory, start Tomcat, and open:

`http://localhost:8080/student-marks-calculator/`

In Eclipse, import as **Existing Maven Project**, configure **Apache Tomcat v9.0 Server**, then use **Run As > Run on Server**.

## Grade rules
- A: average >= 90
- B: average >= 75 and < 90
- C: average >= 60 and < 75
- D: average >= 40 and < 60
- Fail: average < 40

Marks must be whole numbers from 0 through 100 inclusive. Server-side validation rejects missing, non-numeric, decimal, negative, and greater-than-100 marks.
