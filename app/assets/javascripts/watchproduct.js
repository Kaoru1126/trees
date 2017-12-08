$(function(){

  // #watchのAJAXの記述
  $('.watchTrigger').on('click', function() {
      console.log("watched")
      var userId = $(this).attr("user-id");
      var productId = $(this).attr("product-id");
      // console.log("productId");
      $.ajax({
        type: 'POST',
        url: '/watchproducts',
        data: {user_id:userId, product_id:productId}
      })
      .done(function(data){
        console.log(this)
      })
      .fail(function(){
        alert('気になるリストにいれました');
      });
  });
  // #UNwatchのAJAXの記述
  $('.unfavTrigger').on('click', function() {
    console.log("unwatched")
    var userId = $(this).attr("user-id");
    var productId = $(this).attr("product-id");
    $.ajax({
      type: 'DELETE',
      url: '/watchproducts/:id',
      data: {user_id:userId, product_id:productId}
    })
    .done(function(data){
      console.log(this);
    })
  });

});