$(document).ready(function() {
   $('#creatKbase').click(function(){
      $('#kBaseBox').fadeIn();
      $(this).fadeOut();
   })

   $('#hideForm').click(function(){
        $('#kBaseBox').fadeOut();
        $('#creatKbase').fadeIn();
   })
   	function updateCheckedCount() {
   	 $("#itemSelectd").html($("input[type=checkbox]:checked").length);
   	}

	$('#tableList1').DataTable( {
        "scrollY":        "200px",
        "scrollCollapse": false,
        "paging":         false
    });

});