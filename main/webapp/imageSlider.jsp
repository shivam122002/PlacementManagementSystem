<%@page import="java.util.List"%>
<%@page import="placementMangmentSystem.entity.SelectedStudent"%>
<%@page import="placementMangmentSystem.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@include file="all_css_js.jsp" %>

<style>
    /* Style for responsive images and card width */
    .carousel-inner .card {
        max-width: 100%; /* Make cards responsive to the container width */
        margin: 0 auto; /* Center the card horizontally */
    }
    
    .carousel-inner .card img {
        max-width: 100%; /* Make images responsive within the card */
        height: auto;    /* Maintain aspect ratio */
    }
</style>

<div class="container text-center">
    <div id="card-slider" class="carousel slide" data-ride="carousel" data-interval="3000">
        <!-- Carousel Inner -->
        <div class="carousel-inner">
            <%
            Session s = FactoryProvider.getFactory().openSession();
            List<SelectedStudent> students = s.createQuery("from SelectedStudent", SelectedStudent.class).list();
            boolean first = true;
            int slideNumber = 0; // Counter for slide number
            for (SelectedStudent student : students) {
            %>
            <div class="carousel-item <%= first ? "active" : "" %>">
                <div class="card">
                    <img src="student_photoes/<%= student.getStudent_pic() %>" class="card-img-top" alt="<%= student.getName() %>"
                         style="max-width: 100%; height: auto;">
                    <div class="card-body">
                        <h5 class="card-title"><%= student.getName() %></h5>
                        <p class="card-text">B.Tech <%= student.getBranch() %> <%=student.getPassout_year() %></p>
                        <h3>Package: <%= student.getSalary() %></h3>
                        <h4>At <%= student.getCompany_name() %></h4>
                    </div>
                </div>
            </div>
            <%
                first = false;
                slideNumber++; // Increment slide number
            }
            %>
        </div>
        
        <!-- Automatic Carousel Controls -->
        <a class="carousel-control-prev" href="#card-slider" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#card-slider" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>

<script>
    // JavaScript to initialize the carousel for automatic sliding
    $(document).ready(function () {
        $("#card-slider").carousel();
    });
</script>
