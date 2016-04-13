
	$(document).ready(function(){
	
	
		var messageResourceTable = $('#messageResourceTable').DataTable({
			ajax: {
				url: rootContext + "/restful/messageresource/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/messageresource/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/messageresource/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/messageresource/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var viewURI = rootContext + "/messageresource/" + row.id + "/view";
					var viewAnchorText = "<div><a href='" + viewURI + "' aria-label=''>Page Administration</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + viewAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "messageKey"
			},
			{
				"targets": 2,
				"data": "locale"
			},
			{
				"targets": 3,
				"data": "localeReferenceId"
			},
			{
				"targets": 4,
				"data": "message"
			}
			]
		} );
	  
	});	
