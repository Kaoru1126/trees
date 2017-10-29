$(function(){

  // #favのAJAXの記述
  $('.favTrigger').on('click', function() {
      console.log("liked")
      var userId = $(this).attr("user-id");
      var productId = $(this).attr("product-id");
      // console.log("productId");
      $.ajax({
        type: 'POST',
        url: '/favproducts',
        data: {user_id:userId, product_id:productId}
      })
      .done(function(data){
        console.log(this)
      })
      .fail(function(){
        alert('error');
      });
  });
  // #UNfavのAJAXの記述
  $('.unfavTrigger').on('click', function() {
    console.log("unliked")
    var userId = $(this).attr("user-id");
    var productId = $(this).attr("product-id");
    $.ajax({
      type: 'DELETE',
      url: '/favproducts/:id',
      data: {user_id:userId, product_id:productId}
    })
    .done(function(data){
      console.log(this);
    })
    // .fail(function(){
    //   alert('error');
    // });
  });

});