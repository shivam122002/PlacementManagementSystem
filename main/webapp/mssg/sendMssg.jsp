<%
String query = (String) session.getAttribute("query");
if (query != null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Success Alert</title>
    <!-- Include SweetAlert library -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
    <script>
        // Use SweetAlert to show the "Delete Successfully" message
        Swal.fire({
        	icon: 'success',
            title: '<%= query %>',
            text: 'Click on OK ',
            confirmButtonText: 'OK',
        }).then(() => {
            // Redirect to showNotes.jsp
            window.location.href = "contact.jsp";
        });
    </script>
</body>
</html>
<%
   // Clear the session attribute after showing the message
   session.removeAttribute("message");
}
%>
