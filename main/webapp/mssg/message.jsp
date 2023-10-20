<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String message = (String) session.getAttribute("message");
if (message != null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success Alert</title>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <script>
        // Use SweetAlert to show the message
        Swal.fire({
            icon: 'warning',
            title: '<%= message %>',
            text: 'Try again.',
            showCancelButton: false,
            confirmButtonText: 'Ok',
          
        }).then((result) => {
            if (result.isConfirmed) {
                // Redirect to addNote.jsp
                window.location.href = "login.jsp";
            }
        });
    </script>
</body>
</html>
<%
   // Clear the session attribute after showing the message
   session.removeAttribute("message");
}
%>
