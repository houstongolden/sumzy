window.onload = function() {
	SC.initialize({
		client_id: 'e0a60d680d21ee1b0eb120d48f8f3976',
		redirect_uri: 'http://127.0.0.1:3000/soundcloud_callback.html',
	});

// SC.connect(function(){
//   SC.put("/me/followings/702473", function(user, error){
//     if(error){
//       alert("Error: " + error.message);
//     } else{
//       alert("You are now following " + user.username);
//     }
//   });
// });



function playArtistSound(artist) {
	SC.get('/tracks', 
	 	function(tracks) {
		SC.oEmbed("https://api.soundcloud.com/tracks.format?consumer_key=apigee&q=trending&tags=music&filter=all&order=created_at", { auto_play: true}, document.getElementById('artist_player'));
	});

	var menuLinks = document.getElementsByClassName('artist');
	for (var i = 0; i < menuLinks.length; i++) {
		var menuLink = menuLinks[i];
		menuLink.onclick = function(e) {
			e.preventDefault();
			playArtistSound(menuLink.innerHTML);
		};
	  };
};









function playSomeSound(genre) {
	SC.get('/tracks', {
		genres: genre,
		bpm: {
			from: 100
		},
	}, function(tracks) {
		var random = Math.floor(Math.random() * 22);
		SC.oEmbed("http://soundcloud.com/houstongolden", { auto_play: true}, document.getElementById('target'));
	});
};



var menuLinks = document.getElementsByClassName('genre');
for (var i = 0; i < menuLinks.length; i++) {
	var menuLink = menuLinks[i];
	menuLink.onclick = function(e) {
		e.preventDefault();
		playSomeSound(menuLink.innerHTML);
	};
  };
};