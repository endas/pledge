
	$(document).ready(function(){
	
	
		var accommodationPledgeTable = $('#accommodationPledgeTable').DataTable({
			ajax: {
				url: rootContext + "/restful/accommodationpledge/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/accommodationpledge/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/accommodationpledge/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/accommodationpledge/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var registerOfPledgesURI = rootContext + "/accommodationpledge/" + row.id + "/registerofpledges";
					var registerOfPledgesAnchorText = "<div><a href='" + registerOfPledgesURI + "' aria-label=''>Pledge Profile</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + registerOfPledgesAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "addressOne"
			},
			{
				"targets": 2,
				"data": "addressTwo"
			},
			{
				"targets": 3,
				"data": "city"
			},
			{
				"targets": 4,
				"data": "stateProvinceRegion"
			},
			{
				"targets": 5,
				"data": "postCode"
			},
			{
				"targets": 6,
				"data": "countryReferenceTranslation"
			},
			{
				"targets": 7,
				"data": "accommodationDateFrom"
			},
			{
				"targets": 8,
				"data": "accommodationDateTo"
			},
			{
				"targets": 9,
				"data": "accommodationTypeReferenceTranslation"
			},
			{
				"targets": 10,
				"data": "accommodationConditionReferenceTranslation"
			},
			{
				"targets": 11,
				"data": "numberOfBedsReferenceTranslation"
			},
			{
				"targets": 12,
				"data": "vacantOrSharedReferenceTranslation"
			},
			{
				"targets": 13,
				"data": "canYouAccommodateReferenceTranslation"
			},
			{
				"targets": 14,
				"data": "additionalInformation"
			}
			]
		} );
	  
	});	
