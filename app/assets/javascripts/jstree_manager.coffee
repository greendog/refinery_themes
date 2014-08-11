#= require jstree/jstree.min

class @JstreeManager
  constructor: ->
    @tree = $("#jsTree")
    @buildTree()
    @tree

  uploadFile = (obj) ->
    iframe = $("<iframe id='dialog_iframe' frameborder='0' marginheight='0' marginwidth='0' border='0'></iframe>")
    iframe.corner "8px"  unless $.browser.msie
    iframe.dialog
      title: "Upload New File"
      modal: true
      resizable: false
      autoOpen: true
      open: onOpenDialog
      close: onCloseDialog
    iframe.attr "src", "/refinery/themes/editor/upload_file?app_dialog=true&dialog=true&path="+obj.attr("fullpath")

  buildTree: ->
    @tree.jstree
      core:
        animation: 0
        check_callback: true
        themes:
          stripes: true

        data:
          url: (node) ->
            (if node.id is "#" then "/refinery/themes/editor/list" else "ajax_demo_children.json")
          type: "POST"
          data: (node) ->
            fullpath: (if node.attr then node.attr("fullpath") else "")

      types:
        "#":
          max_children: 1
          max_depth: 4
          valid_children: ["drive"]

        root:
          icon: "/static/3.0.3/assets/images/tree_icon.png"
          valid_children: ["default"]

        default:
          valid_children: [
            "default"
            "file"
          ]

        file:
          icon: "glyphicon glyphicon-file"
          valid_children: []

      plugins: [
        "contextmenu"
        "dnd"
        "search"
        "state"
        "types"
        "wholerow"
      ]