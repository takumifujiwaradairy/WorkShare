// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require tempusdominus-bootstrap-4.js

//= require moment
//= require moment/ja.js
//= require tempusdominus-bootstrap-4.js

import 'bootstrap';
import '../stylesheets/application';
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
require('jquery')
require("@fortawesome/fontawesome-free/js/all")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
