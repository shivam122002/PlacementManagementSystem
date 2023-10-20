
<%@include file="/all_css_js.jsp" %>
 <div class="modal fade" id="addSelectedStudentModel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Selected Student</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
         <form action="../AddSelectedStudentServlet" method="POST" id="add-SelectedStudent-form"  enctype="multipart/form-data">
            
            
            <div class="form-group">
                <input  name="student_id" type="text" placeholder="Enter student Enrollment Number" class="form-control"  required>
            </div>
            
            <div class="form-group">
                <input  name="student_name" type="text" placeholder="Enter Student Name" class="form-control"  required >
            </div>
            
            <div class="form-group">
                <input  name="branch" type="text" placeholder="Branch" class="form-control"  required>
            </div>
            
            <div class="form-group">
                <input  name="passout_year" type="text" placeholder="Passout-year" class="form-control" required>
            </div>
            
            <div class="form-group">
                <input  name="package" type="text" placeholder="Package" class="form-control">
            </div>
            <div class="form-group">
                <input  name="company_name" type="text" placeholder="Company name" class="form-control" required>
            </div>
            
            
            <div class="form-group">
                <input  name="job_profile" type="text" placeholder="Enter job profile" class="form-control" required>
            </div>
            
            <br>
            <div class="form-group">
               <label>Student image:</label>
               <br>
               <input type="file" class="from-control" name="student_pic"  required>
            </div>
            
            <div class="container text-center">
               <button type="submit" class="btn btn-outline-primary">Save student </button>
            </div>
         </form>
      </div>
      
    </div>
  </div>
</div>
