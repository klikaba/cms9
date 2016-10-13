$(document).ready(function(){
    var maxFields = 5;
    var count = ( $('.multi-pick').length - 1 ) ? ( $('.multi-pick').length - 1 ) : 1;

    if($("#post_field_field_type").val() == "select_single" || $("#post_field_field_type").val() == "select_multiple"){
      $('#image_sizer').css('display', 'none');
      $("#valueSet").css('display', 'block');
      $("#addNewValue").css('visibility', 'visible');
    } else if($("#post_field_field_type").val() == "image") {
      $('#image_sizer').css('display', 'block');
      $("#valueSet").css('display', 'none');
      $("#addNewValue").css('visibility', 'hidden');
    } else {
      $('#image_sizer').css('display', 'none');
      $("#valueSet").css('display', 'none');
      $("#addNewValue").css('visibility', 'hidden');
    }

    $("#post_field_field_type").change(function(){
        if($("#post_field_field_type").val() == "select_single" || $("#post_field_field_type").val() == "select_multiple"){
          $('#image_sizer').css('display', 'none');
          $('input.image-sizer[type="text"]').val('');
          $('input.multi-pick[type="text"]').val('');
          $("#valueSet").css('display', 'block');
          $("#addNewValue").css('visibility', 'visible');
        } else if($("#post_field_field_type").val() == "image") {
          $('#image_sizer').css('display', 'block');
          $("#valueSet").css('display', 'none');
          $("#addNewValue").css('visibility', 'hidden');
          resetFields();
        } else {
          $('#image_sizer').css('display', 'none');
          $('input.multi-pick[type="text"]').val('');
          $('input.image-sizer[type="text"]').val('');
          $("#valueSet").css('display', 'none');
          $("#addNewValue").css('visibility', 'hidden');
          resetFields();
        }
    });

    $("#addNewValue").click(function(){
      if(count < maxFields) {
        $("#valueSet").append($("#selector_").html());
        $('input', $('#valueSet')).each(function () {
          $(this).attr('required', true);
        });

        count++;
      }
    });

    function resetFields() {
      $('#valueSet .multi-block').each(function(index) {
        if(index !== 0) {
          $(this).remove();
        }
      });

      count = 1;

      $('#multi_values_').removeAttr('required');
    }

    deleteChoice = function(el) {
       $(el).parent().parent().parent().fadeOut(300, function() {
         $(this).remove();
         count--;
       });
    }
});
