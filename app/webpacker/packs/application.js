/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)

import '../src/javascripts/jquery-migrate-3.1.0.min.js';
import '../src/javascripts/jquery-ui.min.js';
import '../src/javascripts/jquery.hoverIntent.minified.js';
import '../src/javascripts/bootstrap.min.js';
// import '../src/javascripts/ualib-home.js';
import '../src/stylesheets/application.scss';


