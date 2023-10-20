<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String mssg = (String) session.getAttribute("mssg");
if (mssg != null) {
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
            icon: 'success',
            title: '<%= mssg %>',
            text: 'Click On Ok',
            showCancelButton: false,
            confirmButtonText: 'Ok',
          
        }).then((result) => {
            if (result.isConfirmed) {
                // Redirect to addNote.jsp
                window.location.href = "admin.jsp";
            }
        });
    </script>
</body>
</html>
<%
   // Clear the session attribute after showing the message
   session.removeAttribute("mssg");
}
%>
