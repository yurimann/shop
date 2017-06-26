$(document).on("ready", function(){
  $('.test').on("click", function(){

    var udan = $("#user_delivery_apartment_number");
    var uds = $("#user_delivery_street");
    var udc = $("#user_delivery_city");
    var udpc = $("#user_delivery_postal_code");

    console.log($('input[name="test1"]:checked').length);
    if ($('input[name="test1"]:checked').length > 0) {

      udan.attr("value", $("#user_apartment_number").val());
      uds.attr("value", $("#user_street").val());
      udc.attr("value", $("#user_city").val());
      udpc.attr("value", $("#user_postal_code").val());

      // udan.attr("disabled", "true");
      // uds.attr("disabled", "disabled");
      // udc.attr("disabled", "disabled");
      // udpc.attr("disabled", "disabled");
    }
    else {
      udan.attr("disabled", false);
      uds.attr("disabled", false);
      udc.attr("disabled", false);
      udpc.attr("disabled", false);
    }
  });
})
