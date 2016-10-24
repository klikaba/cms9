$( document ).ready(function() {
  $('#upload-image-field').change(function() {
      var output = document.getElementById('post-image');
      var removeLink = document.getElementById('remove-image');

      var fr = new FileReader();
      fr.onload = function() {
          var img = new Image;
          img.onload = function() {
          };
          img.src = fr.result;
      };
      output.src = URL.createObjectURL(this.files[0]);
      output.style.display = 'block';
      removeLink.style.display = 'inline-block';

      fr.readAsDataURL(this.files[0]);
  });

});


var deleteFile = function(value) {
  var inputField = document.getElementById('upload-image-field');
  var output = document.getElementById('post-image');
  var removeLink = document.getElementById('remove-image');
  var rmValue = document.getElementById('remove-value');

  if(value === 'edit' && output.style.display !== 'none') {
    rmValue.value = true;
  }

  inputField.value = '';
  output.src = '#';
  output.style.display = 'none';
  removeLink.style.display = 'none';
};
