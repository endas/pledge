
	$(document).ready(function(){
	
	
		var referenceTable = $('#referenceTable').DataTable({
			ajax: {
				url: rootContext + "/restful/reference/list",
				dataSrc: '',
				"deferRender": true
			},
			"columnDefs": [ {
				"orderable": false,
				"targets": 0,
				"data": function ( row, type, val, meta ) {
					var showURI = rootContext + "/reference/" + row.id;
					var showButtonText = "<a href='" + showURI + "' class='btn btn-info btn-sm' aria-label='view'><span class='glyphicon glyphicon-info-sign'></a>";					
					var updateURI = rootContext + "/reference/" + row.id + "/update";
					var updateButtonText = "<a href='" + updateURI + "' class='btn btn-primary btn-sm' aria-label='edit'><span class='glyphicon glyphicon-pencil'></a>";					
					var deleteURI = rootContext + "/reference/" + row.id + "/update";
					var deleteButtonText = "<a href='" + deleteURI + "' class='btn btn-danger btn-sm' aria-label='delete'><span class='glyphicon glyphicon-remove-sign'></a>";					

					return "<div class='btn-group-vertical' role='group'>" + showButtonText + updateButtonText + deleteButtonText + "</div>";

				}
			},
			
			{
				"orderable": false,
				"targets": -1,
				"data": function ( row, type, val, meta ) {
					
					var referenceCategoryURI = rootContext + "/reference/" + row.id + "/referencecategory";
					var referenceCategoryAnchorText = "<div><a href='" + referenceCategoryURI + "' aria-label=''>Reference Categories</a></div>";

					var anchorLinks = "";
					
					anchorLinks = anchorLinks + referenceCategoryAnchorText;
					
				
					return anchorLinks;

				}
			},
			  
			{
				"targets": 1,
				"data": "refType"
			},
			{
				"targets": 2,
				"data": "refDesc"
			},
			{
				"targets": 3,
				"data": "parentId"
			},
			{
				"targets": 4,
				"data": "refIndex"
			},
			{
				"targets": 5,
				"data": "description"
			}
			]
		} );
	  
	});	
