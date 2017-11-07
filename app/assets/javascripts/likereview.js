$(function(){

  // #reviewLikeのAJAXの記述
  $('.likeReviewTrigger').on('click', function() {
      console.log("liked the review")
      var userId = $(this).attr("user-id");
      var reviewId = $(this).attr("review-id");
      // console.log("productId");
      $.ajax({
        type: 'POST',
        url: '/likereviews',
        data: {user_id:userId, review_id:reviewId}
      })
      .done(function(data){
        console.log(this)
      })
      .fail(function(){
        alert('likederror');
      });
  });
  // #UNreviewLikeのAJAXの記述
  $('.unlikeReview').on('click', function() {
    console.log("unliked the review")
    var userId = $(this).attr("user-id");
    var reviewId = $(this).attr("review-id");
    $.ajax({
      type: 'DELETE',
      url: '/likereviews/:id',
      data: {user_id:userId, review_id:reviewId}
    })
    .done(function(data){
      console.log(this);
    })
    // .fail(function(){
    //   alert('error');
    // });
  });

});