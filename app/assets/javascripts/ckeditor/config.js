CKEDITOR.editorConfig = function(config) {

  // Filebrowser routes
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/cms9/ckeditor/attachment_files";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/cms9/ckeditor/attachment_files";
  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/cms9/ckeditor/attachment_files";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/cms9/ckeditor/pictures";
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/cms9/ckeditor/pictures";
  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/cms9/ckeditor/pictures";
  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/cms9/ckeditor/attachment_files";

  return true;
};
