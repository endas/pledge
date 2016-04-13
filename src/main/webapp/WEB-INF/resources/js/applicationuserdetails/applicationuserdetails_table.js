
	$(document).ready(function(){
	
	
		var applicationUserDetailsTable = $('#applicationUserDetailsTable').DataTable({
			ajax: {
				url: rootContext + "/restful/applicationuserdetails/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/applicationuserdetails/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/applicationuserdetails/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/applicationuserdetails/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var registerOfPledgesURI = rootContext + "/applicationuserdetails/" + row.id + "/registerofpledges";
					var registerOfPledgesAnchorText = "<div><a href='" + registerOfPledgesURI + "' aria-label=''>Pledge Profile</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + registerOfPledgesAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "contactName"
			},
			{
				"targets": 2,
				"data": "representOrganisationReferenceTranslation"
			},
			{
				"targets": 3,
				"data": "telephoneNumber"
			},
			{
				"targets": 4,
				"data": "addressOne"
			},
			{
				"targets": 5,
				"data": "addressTwo"
			},
			{
				"targets": 6,
				"data": "city"
			},
			{
				"targets": 7,
				"data": "stateProvinceRegion"
			},
			{
				"targets": 8,
				"data": "postCode"
			},
			{
				"targets": 9,
				"data": "countryReferenceTranslation"
			},
			{
				"targets": 10,
				"data": "emailAddress"
			}
			]
		} );
	  
	});	
