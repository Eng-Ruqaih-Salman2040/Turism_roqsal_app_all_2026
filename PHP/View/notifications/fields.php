                     <input type="hidden" id="id" name="id">                                      
			 <div class="form-group">
                                            <label>الافعالية</label>
                                            <textarea class="form-control"  id="note" name="note" placeholder=" الافعالية" rows="5"></textarea>
                                        </div>  
				
                   <script type="text/javascript">

				   
function dispalyData(elem){
 var id=$(elem).attr('data-id');
  var note=$(elem).attr('data-note');
 
     $('#id').val(id)
     $("#note").val(note)
    
 $('#modal_edit').modal('show'); 
 }

    
 </script>                