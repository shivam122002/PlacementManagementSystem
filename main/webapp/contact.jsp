<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_css_js.jsp"%>
<title>Contact with us</title>
</head>
<body>
	<%@include file="nav-bar.jsp"%>
	<br>
	<section class="bg-gray-100 py-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<!-- Embedded Google Map with MIT Ujjain location -->
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d14570.433693225306!2d75.07279519999999!3d24.080090249999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1694880422842!5m2!1sen!2sin"
						width="1100" height="700" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
				<div class="col-lg-6">
					<div class="bg-white rounded-lg p-4 shadow">
						<h2 class="text-gray-900 text-2xl font-medium mb-3">Ask..</h2>
						<p class="text-gray-600 mb-4">Feel Free to ask anything,our
							team will be contact to you soon</p>
						<form method="POST" action="StudentQueryServlet">
							<div class="mb-3">
								<label for="email" class="form-label text-gray-600">Email</label>
								<input type="email" id="email" name="email" class="form-control"
									placeholder="Your email" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label text-gray-600">Enrollment
									Number</label> <input type="text" id="enrollment" name="enrollment"
									class="form-control" placeholder="Your enrollment number"
									required>
							</div>
							<div class="mb-3">
								<label for="message" class="form-label text-gray-600">Message</label>
								<textarea id="message" name="message" class="form-control"
									placeholder="Your message" rows="4" required></textarea>
							</div>
							<button class="btn btn-primary btn-lg">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>