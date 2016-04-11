// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require websocket_rails/main
//= require_tree .


$( document ).ready(function() {
	var dispatcher = new WebSocketRails('localhost:3001/websocket');

	//= require jquery_ujs
	//= require websocket_rails/main
	//= require_tree .

	//

	dispatcher.on_open = function(data) {
	  console.log('Connection has been established: ', data);
	  // You can trigger new server events inside this callback if you wish.
	  var channel = dispatcher.subscribe('mymails');

		// bind to a channel event
		channel.bind('new', function(data) {
		  console.log('channel event received: ');
		  html = new EJS({url: 'ejs/mymail.ejs'}).render(data);
		  $("div#mail-container").prepend(html);
		});
	}

	$("body #mail-container").delegate(".message_container","click",function(){
		$(".message_container").removeClass("selected");
		$(".message").hide();
		$(this).addClass("selected");
	})
	$("body #mail-container").delegate(".message_container","dblclick",function(){
		$(this).find(".message").show();
	})
});
