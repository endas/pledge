
	$(document).ready(function(){
	
		var servicePledgeTable = $('#servicePledgeTable').DataTable({
			ajax: {
				url: rootContext + "/restful/servicepledge/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/servicepledge/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/servicepledge/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/servicepledge/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var registerOfPledgesURI = rootContext + "/servicepledge/" + row.id + "/registerofpledges";
					var registerOfPledgesAnchorText = "<div><a href='" + registerOfPledgesURI + "' aria-label=''>Pledge Profile</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + registerOfPledgesAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "pledgeServiceLevelOneReferenceTranslation"
			},
			{
				"targets": 2,
				"data": "pledgeServiceLevelTwoReferenceTranslation"
			},
			{
				"targets": 3,
				"data": "pledgeServiceLevelThreeReferenceTranslation"
			},
			{
				"targets": 4,
				"data": "additionalInformation"
			},
			{
				"targets": 5,
				"data": "pledgeServiceQualification"
			},
			{
				"targets": 6,
				"data": "pledgeServiceDateAvailable"
			},
			{
				"targets": 7,
				"data": "pledgeServiceHoursPerWeekReferenceTranslation"
			}
			]
		} );
	  
	});	
