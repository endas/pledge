
	$(document).ready(function(){
	
	
		var registerOfPledgesTable = $('#registerOfPledgesTable').DataTable({
			ajax: {
				url: rootContext + "/restful/registerofpledges/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/registerofpledges/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/registerofpledges/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/registerofpledges/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			]
		} );
	  
	});	
