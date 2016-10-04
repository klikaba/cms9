var loadFile = function(event) {
  var output = document.getElementById('post-image');
  var removeLink = document.getElementById('remove-image');
  if(event.target.files[0]) {
    output.src = URL.createObjectURL(event.target.files[0]);
    output.style.display = 'block';
    removeLink.style.display = 'inline-block';
  }
};

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
