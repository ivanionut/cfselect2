<!DOCTYPE html>
<html lang="en">
    <head>        
        <!-- META SECTION -->
        <title>Atlant - Responsive Bootstrap Admin Template</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
        <!-- EOF CSS INCLUDE -->                                       
    </head>
    <body>
        <form id="fName" role="form" class="form-horizontal" method="post" action="">
            <div class="form-group">
                <label class="col-md-3 control-label">Select2</label>  
                <div class="col-md-9">
                    <input type="hidden" name="select2" id="select2" class="form-control" value="">
                </div>
            </div>
        </form>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
    </body>
</html>

<script type="text/javascript">
jQuery(document).ready(function () {  
    $("#select2").select2({
        minimumInputLength: 3,
        allowClear: true,
        ajax: { // instead of writing the function to execute the request we use Select2's convenient helper
            url: "select2.cfc?returnformat=json", //myComponents.cfm is coldfusion component name
            dataType: 'json',
            quietMillis: 250,
            data: function (term, page) {
                return {
                    method: "find", // functionName
                    key: term, // search term
                    page_limit: 10, //Limit found
                    page: page
                };
            },
            results: function (data, page) {
                var more = (page * 10) < data.total;
                return { results: data.clients, more: more };
            }
        }
    });
});
</script>