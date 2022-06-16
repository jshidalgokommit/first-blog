/**
 * show confirm dialog and delete article on confirm response
 */
function delete_article(){
    if (confirm('are you sure?')){
        document.getElementById("delete_article_form").submit();
    }
}