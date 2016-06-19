
	$(document).ready(function(){
	
	
		var goodsPledgeTable = $('#goodsPledgeTable').DataTable({
			ajax: {
				url: rootContext + "/restful/goodspledge/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/goodspledge/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/goodspledge/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/goodspledge/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var registerOfPledgesURI = rootContext + "/goodspledge/" + row.id + "/registerofpledges";
					var registerOfPledgesAnchorText = "<div><a href='" + registerOfPledgesURI + "' aria-label=''>Pledge Profile</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + registerOfPledgesAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "goodsCategoryOneReferenceTranslation"
			},
			{
				"targets": 2,
				"data": "goodsCategoryTwoReferenceTranslation"
			},
			{
				"targets": 3,
				"data": "goodsCategoryThreeReferenceTranslation"
			},
			{
				"targets": 4,
				"data": "goodsQuantityReferenceTranslation"
			},
			{
				"targets": 5,
				"data": "additionalInformation"
			},
			{
				"targets": 6,
				"data": "itemSize"
			}
			]
		} );
	  
	});	
