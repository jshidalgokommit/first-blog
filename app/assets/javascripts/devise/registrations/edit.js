/**
 * show confirm dialog and cancel user account
 */
function cancel_account(){
    if (confirm('are you sure?')){
        document.getElementById("cancel_account_form").submit();
    }
}

