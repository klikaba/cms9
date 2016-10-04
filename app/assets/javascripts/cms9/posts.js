$(document).ready(function(){
    $('.froala-editor').froalaEditor({
      heightMin: 200,
      heightMax: 250,
      pastePlain: true,
      toolbarButtons: ['bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', 'fontFamily', 'fontSize', 'color', 'inlineStyle', 'paragraphStyle', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', 'insertHR', 'insertLink', 'insertImage', 'insertVideo', 'insertFile', 'insertTable', 'undo', 'redo', 'clearFormatting', 'selectAll', 'html', 'fullscreen']
    });
});

function patchImage (post_id, field_id) {
  var inputField = document.getElementById('upload-image-field');
  var output = document.getElementById('post-image');
  var removeLink = document.getElementById('remove-image');

  var request = $.ajax({
    url: "/cms9/posts/" + post_id + "/fields/" + field_id,
    method: "PATCH"
  });

  request.done(function( msg ) {
    inputField.value = '';
    output.src = '#';
    output.style.display = 'none';
    removeLink.style.display = 'none';
  });

  request.fail(function( jqXHR, textStatus ) {
    console.log(textStatus);
  });
}

var loadFile = function(event) {
  var output = document.getElementById('post-image');
  var removeLink = document.getElementById('remove-image');
  if(event.target.files[0]) {
    output.src = URL.createObjectURL(event.target.files[0]);
    output.style.display = 'block';
    removeLink.style.display = 'inline-block';
  }
};

var deleteFile = function(value, field_id, post_id, image) {
  var inputField = document.getElementById('upload-image-field');
  var output = document.getElementById('post-image');
  var removeLink = document.getElementById('remove-image');

  if(value === 'edit' && output.style.display !== 'none') {
    patchImage(post_id, field_id);
  } else {
    inputField.value = '';
    output.src = '#';
    output.style.display = 'none';
    removeLink.style.display = 'none';
  }
};
