// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.syncHeight.min
//= require gritter
//= require foundation
//= require turbolinks
//= require_tree .

$(function () {
    $(document).foundation();
});

$(window).load(function () {
    $('.synchH div.panel .itemTitle').syncHeight({ 'updateOnResize': true});
});

$(window).on('page:before-change',function () {
    $('.synchH div.panel .itemTitle').syncHeight({ 'updateOnResize': true});
});

$(window).on('page:load',function () {
    $('.synchH div.panel .itemTitle').syncHeight({ 'updateOnResize': true});
});
//and to undo the syncing again run (here when the window is smaller than 500px):
$(window).resize(function () {
    if ($(window).width() < 500) {
        $('.synchH div.panel .itemTitle').unSyncHeight();
    }
});
