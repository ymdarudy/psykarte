$(document).on("turbolinks:load", function () {
  var height = 20 + $(".navbar").height();
  $("body").css("padding-top", height);
  console.log(height);
});

$(window).resize(function () {
  var height = 20 + $(".navbar").height();
  $("body").css("padding-top", height);
  console.log(height);
});
