$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  // $(".alert").fadeOut( "slow" );
  // $('.alert').fadeIn(200).delay(5000).fadeOut(200).remove();
  $(".alert").animate({opacity: 1.0}, 5000).fadeOut();

});
