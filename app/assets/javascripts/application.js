// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-tab
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require bootstrap-popover
//= require_tree .

function create_tab(client_id, client_name) {
    $.ajax({
        url: site_url('client/ajax_show/' + client_id),
        data: {  },
        type: 'get',
        success: function(data) {
            $('#clients_tabs_content')
                .append(
                $('<div></div>')
                    .addClass('tab-pane')
                    .attr('id', 'client-' + client_id)
                    .html(data)
            );

            $('#clients_tabs').append(
                $('<li></li>')
            );

            $('#clients_tabs li:last').append(
                $('<a></a>')
                    .attr('data-toggle', 'tab')
                    .attr('href', '#client-' + client_id)
                    .html(client_name + '<button style="margin-left: 5px;" type="button" class="close" data-dismiss="alert" onclick="select_last_tab();">&times;</button>')
            );

            $('#clients_tabs li:last a').tab('show');
        }
    });
}

function select_last_tab() {
    $('#clients_tabs li:last a').tab('show');
}

function site_url(addition_url) {

    var lang_abbr = '';
    var add_sub_dir = '';

    if(typeof(addition_url) == 'undefined') {
        addition_url = '';
    }
    /*
     var url = location.href;  // entire url including querystring - also: window.location.href;
     var baseURL = url.substring(0, url.indexOf('/', 14));

     var relative_uri = location.pathname;
     relative_uri_arr = relative_uri.split("/");
     relative_uri = "/"+relative_uri_arr[1];

     if (baseURL.indexOf('http://localhost') != -1) {
     // Base Url for localhost
     var url = location.href;  // window.location.href;
     var pathname = location.pathname;  // window.location.pathname;
     var index1 = url.indexOf(pathname);
     var index2 = url.indexOf("/", index1 + 1);
     var baseLocalUrl = url.substr(0, index2);

     return baseLocalUrl + '/' + add_sub_dir + addition_url;
     } else {
     if(relative_uri_arr[2].length == 2) {
     lang_abbr = relative_uri_arr[2] + '/';
     }

     return baseURL + '/' + add_sub_dir + lang_abbr + addition_url;
     }
     */
    return 'http://localhost:3000/' + addition_url;
}
