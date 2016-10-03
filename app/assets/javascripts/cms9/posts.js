$(document).ready(function(){
    $('.froala-editor').froalaEditor({
      heightMin: 200,
      heightMax: 250,
      pastePlain: true
    });
});

var loadFile = function(event) {
  var output = document.getElementById('post-image');
  if(event.target.files[0]) {
    output.src = URL.createObjectURL(event.target.files[0]);
  }
};
