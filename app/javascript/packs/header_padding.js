$(window).on("load resize", function () {
  var height = 20 + $(".navbar").height();
  $("body").css("padding-top", height);
});
