	

// 	getMe: ->
// 		return true

var geoLocation = {
	what: function(){
		return false;
	},
	create: function(){
		var newHand = Object.create(this);
		return newHand;
	}	
}

var testMe = {
	dude: function (){
		return true;
	},
	getLocation: function () {
		navigator.geolocation.getCurrentPosition(this.setGeoCookie);
	},
	setGeoCookie: function (position) {
	var cookie_val = position.coords.latitude + "," + position.coords.longitude;
  document.cookie = "lat_lng=" + escape(cookie_val);
	}
}
