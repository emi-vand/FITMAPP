// app/javascript/plugins/init_star_rating.js
import "jquery-bar-rating";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  $('#gym_review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
