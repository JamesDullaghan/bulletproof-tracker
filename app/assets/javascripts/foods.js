$(function() {
  $('#foods th a, #foods .pagination a').on('click', function(){
    $.getScript(this.href);
    return false;
  });
  $("#foods_search input").keyup(function() {
    $.get($("#foods_search").attr("action"), $("#foods_search").serialize(), null, "script");
    return false;
  });
});