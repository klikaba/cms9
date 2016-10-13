if(window.CKEDITOR) {
  CKEDITOR.editorConfig = function(config) {

    config.filebrowserBrowseUrl = "/cms9/ckeditor/attachment_files";
    config.filebrowserFlashBrowseUrl = "/cms9/ckeditor/attachment_files";
    config.filebrowserFlashUploadUrl = "/cms9/ckeditor/attachment_files";
    config.filebrowserImageBrowseLinkUrl = "/cms9/ckeditor/pictures";
    config.filebrowserImageBrowseUrl = "/cms9/ckeditor/pictures";
    config.filebrowserImageUploadUrl = "/cms9/ckeditor/pictures";
    config.filebrowserUploadUrl = "/cms9/ckeditor/attachment_files";

    return true;
  };
}
