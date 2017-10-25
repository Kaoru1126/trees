$(function() {

// スライドメニューオープン
  $('.sp_btn_image').on('click',function(){
    $('#slide_menu').toggleClass('active');
    console.log ('clicked')
    $('this').toggleClass('on');
    $('this').toggleClass('move');
  });

  $('.menu_close').on('click', function(){
    $('#slide_menu').toggleClass('active');
    $('this').toggleClass('on');
    $('this').toggleClass('move');
    // $('#slide_menu').removeClass('.move.on.btn');
  });

// カードの背景変えたい、by each dominatn
  // var domi = $(".col.s12.fs_26.dominant").text();
  //   if (domi == "Indica") {
  //     $(".col.s6.card.z-depth-3.center-align").addClass("idc");
  //   } else if (domi == "Sativa") {
  //     $(".col.s6.card.z-depth-3.center-align").addClass("stv");
  //   } else if (domi == "Indica Dominant Hybrid") {
  //     $(".col.s6.card.z-depth-3.center-align").addClass("idh");
  //   } else if (domi == "Sativa Dominant Hybrid") {
  //     $(".col.s6.card.z-depth-3.center-align").addClass("sdh");
  //   } else {
  //     $(".col.s6.card.z-depth-3.center-align").addClass("hyb");
  //   }

});

