$(document).bind("mobileinit", function(){
  if ($('#wechat_serivice_application')) {
  $.mobile.ajaxEnabled = false;};
});

$(document).on("pagebeforeshow", "#div_show", function(){

  $("a[name='add_service_order']").click(function(e){
    var service_vendor_id = $(this).data("vendor");
    var service_item_id = $(this).data("item");
    var wechat_user = $(this).data("user");

    $('#service_vendor_id').val(service_vendor_id);
    $('#service_item_id').val(service_item_id);
    $('#wechat_user').val(wechat_user);

    console.log("111"+$('#service_vendor_id').val())
    console.log($('#service_item_id').val())
    console.log($('#wechat_user').val())
  });
  
});
