<!DOCTYPE html>
<html>
	<head>
		    <!-- Required meta tags -->
		    <meta charset="utf-8">
		    <meta name="viewport" content="width=device-width, initial-scale=1">
		
			<link href="css/index.css" />
		    <!-- Bootstrap CSS -->
		    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
	
			<title>Admin - Edit Medicine</title>
	</head>
<body class="bg-danger" style="color:white">
		<div class="container">
			<p class="display-6"><strong>Enter new Medicine details</strong></p>
			<form action="EditMedicine" method="post">

				<%@ page import="java.util.Map, java.util.HashMap, model.*" %>
				<%

					Map<Integer, Tag> tagMap = (HashMap<Integer, Tag>)request.getAttribute("tagMap");
					Map<Integer, Seller> sellerMap = (HashMap<Integer, Seller>)request.getAttribute("sellerMap");
					Map<Integer, Offer> offerMap = (HashMap<Integer, Offer>)request.getAttribute("offerMap");
					Map<Integer, Medicine> medicineMap = (HashMap<Integer, Medicine>)request.getAttribute("medicineMap");
					Integer choice = (Integer)request.getAttribute("choice");
					Medicine medicine = (Medicine)medicineMap.get(choice);
				
				%>
				<input type="hidden" name="id" value = <%= medicine.getId() %> /> <br /> <br /> 
				<label class="form-label" for="name">Name:</label>
				<input class="form-control" type="text" name="name" value = <%= medicine.getName() %> /> <br /> <br /> 
				<label class="form-label" for="description">Description:</label>
				<input class="form-control" type="text" name="description" value = '<%= medicine.getDescription() %>'/><br /> <br />
				<label class="form-label" for="imageUrl">Image Url:</label>
				<input class="form-control" type="text" name="imageUrl" value = '<%= medicine.getImageUrl() %>'/><br /> <br />
				<label class="form-label" for="price">Price:</label>
				<input class="form-control" type="number" min=0 name="price" value = '<%= medicine.getPrice() %>'/><br /> <br />
				<label class="form-label" for="seller">Seller:</label>
				<select class="form-control" name="seller">

				<% 
					String responseStringSeller = "";

					for(Map.Entry<Integer,Seller> entry : sellerMap.entrySet()) {
						Seller seller = (Seller)entry.getValue();
						if(seller.getId()==medicine.getSellerId()){
							responseStringSeller+="<option value='" + seller.getId() + "' selected>" + seller.getName() + "</option>";							
						} else {
							responseStringSeller+="<option value='" + seller.getId() + "'>" + seller.getName() + "</option>";							
						}
					}
				
					out.print(responseStringSeller);
				%>
				
				</select><br/><br/>
				<label class="form-label" for="tag">Tag:</label>
				<select class="form-control" name="tag">
				<%
					String responseStringTag = "";

					for(Map.Entry<Integer,Tag> entry : tagMap.entrySet()) {
						Tag tag = (Tag)entry.getValue();
						if(tag.getId()==medicine.getTagId()){
							responseStringTag+="<option value='" + tag.getId() + "'selected>" + tag.getName() + "</option>";							
						} else {
							responseStringTag+="<option value='" + tag.getId() + "'>" + tag.getName() + "</option>";							
						}
					}
				
					out.print(responseStringTag);
				
				%>
				</select><br/><br/>
				<label class="form-label" for="offer">Offer:</label>
				<select class="form-control" name="offer">
				<%
					String responseStringOffer = "";

					for(Map.Entry<Integer,Offer> entry : offerMap.entrySet()) {
						Offer offer = (Offer)entry.getValue();
						if(offer.getId()==medicine.getOfferId()){
							responseStringOffer+="<option value='" + offer.getId() + "'selected>" + offer.getName() + "</option>";
						} else {
							responseStringOffer+="<option value='" + offer.getId() + "'>" + offer.getName() + "</option>";
						}
					}
				
					out.print(responseStringOffer);
				
				%>
				</select><br/><br/>
				<div class="form-check">
					<label class="form-check-label" for="active">Active:</label>
					<%
						if(medicine.isActive()) {
							out.print("<input class='form-check-input' type='checkbox' name='active' checked/> <br /> <br />");
						} else {
							out.print("<input class='form-check-input' type='checkbox' name='active' unchecked/> <br /> <br />");
						}
					%>
				</div>
				<input class="btn btn-outline-warning" type="submit" value="Submit"/>
			</form>
		</div>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
	</body>
</html>