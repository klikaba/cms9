$(document).ready(function(){
    var maxFields = 5;
    var count = 1;

    if($("#post_field_field_type").val() == "select_single" || $("#post_field_field_type").val() == "select_multiple"){
      $("#valueSet").css('display', 'block');
      $("#addNewValue").css('visibility', 'visible');
    } else {
      $("#valueSet").css('display', 'none');
      $("#addNewValue").css('visibility', 'hidden');
    }

    $("#post_field_field_type").change(function(){
        if($("#post_field_field_type").val() == "select_single" || $("#post_field_field_type").val() == "select_multiple"){
          $("#valueSet").css('display', 'block');
          $("#addNewValue").css('visibility', 'visible');
        } else {
          $('input[type="text"]').val('');
          $("#valueSet").css('display', 'none');
          $("#addNewValue").css('visibility', 'hidden');
        }
    });

    $("#addNewValue").click(function(){
      if(count < maxFields) {
        $("#valueSet").append($("#selector_").html());
        count++;
      }
    });
});
