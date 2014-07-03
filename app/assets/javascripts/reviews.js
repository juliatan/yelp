# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

// place javascript-ajax in reviews.js since the form that we are posting is
// a form_for a review
$(document).ready(function {
  $('.new_review').on('submit', function(event){
    event.preventDefault();

    var restaurant = $(this).closest('.restaurant')
    
    // post the action URL of the form, and take all the data
    // the function here is the callback function
    $.post($(this).attr('action'), $(this).serialize(), function(review){
      // note that review here is an arbitrary name, in this case, it refers to
      // our JSON hash...which we can then call the thoughts and rating key out of
      restaurant.find('ul.reviews').append('<li>'+ review.thoughts + ' (' + review.rating + ')</li>');
      restaurant.find('.average_rating').text(review.new_average_rating);
    });
  });

});