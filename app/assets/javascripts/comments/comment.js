/**
 * show confirm dialog and delete comment on confirm response
 */
function delete_comment(){
    if (confirm('are you sure?')){
        document.getElementById("delete_comment_form").submit();
    }
}

