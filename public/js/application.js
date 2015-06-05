$(document).ready(function() {

  $('.alert').fadeIn(400).delay(2500).fadeOut(400); //fade out after 3 seconds

  // Ajax Rating Button
  $(".my-beers").on("click", "input[type='submit']", function(event) {
    event.preventDefault();
    console.log(this)

    $('.message').addClass("preloader")
    $('.message').text("Calculating Global Beer Rating")
    $('.message').fadeIn(400).delay(2500).fadeOut(400);

    form = $(this).parent()
    url = $(this).parent().attr("action")

    var ratingValue = $(this).siblings("select").val();
    console.log("Ajax Request: " + ratingValue)
    $.ajax({
      method: "put",
      url: url,
      data: { rating : ratingValue }
    }).done(function(ratingData) {
      console.log("success");
      console.log("Ajax Response: " + ratingData);
      parsedRating = JSON.parse(ratingData);

      form.parent().siblings(".beer-rating-user").text(parsedRating.rating_user)
      form.delay(5000).parent().siblings(".beer-rating-global span:first-child").text(parsedRating.rating_global)
      form.parent().siblings(".beer-rating-global span:last-child").text(parsedRating.rating_count)

      form.parent().siblings(".beer-rating-user").addClass("animated fadeIn")
      form.parent().siblings(".beer-rating-global").addClass("animated fadeIn")

      $(".my-beers tr").removeClass("highlight")
      form.parent().parent().addClass("highlight")

      $('.message').removeClass("preloader")
      $('.message').text("Beer Added")
      $('.message').delay(2500).fadeOut(400);

    }).fail(function() {
      console.log("fail");
    });
  });

});
