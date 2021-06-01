// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
var jQuery = require('jquery')
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $axios from 'axios'


document.addEventListener("DOMContentLoaded", function(){

  //-------モーダル画面-------//
  const btn = document.getElementById('avatar_btn');
  const modal = document.getElementById('modal');
  btn.addEventListener('click', function() {
    $(modal).fadeIn(800);
  })

  //モーダル画面close
  const closeBtn = document.getElementById('modal_bg');
  closeBtn.addEventListener('click', function() {
    $(modal).fadeOut(800);
  });

  //-------名前の変更-------//
  $('#profile_submit').click(() => {
    const username = $('#profile_username').val();
    const yourname = document.getElementById('yourname');
    $(yourname).children().remove();
    $(yourname).append(username);

    
    $(modal).fadeOut(800);
  });

  //-------アバターの変更-------//
  $('#profile_avatar').change(function(e){
    //ファイルオブジェクトを取得する
    const file = e.target.files[0];
    const reader = new FileReader();

    //アップロードした画像を設定する
    reader.onload = (function(file){
      return function(e){
        $('#avatar_btn').attr("src", e.target.result);
        $('#avatar_btn').attr("title", file.name);
      };
    })(file);
    reader.readAsDataURL(file);
  });
});
