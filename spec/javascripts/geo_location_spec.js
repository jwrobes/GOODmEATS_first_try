

// describe "GeoLocation", ->

// 	it "returns my name", ->
// 		geo = GeoLocation.new
// 		expect(geo.me).toBe("Me")
describe('GeoLocation', function(){
	it("has something", function(){
		expect(true).toBe(true);
	});

	it ("create an object using prototypical inheritance", function(){
		var geo = geoLocation.create();
		expect(geo.what()).toBe(false);
	});

	it ("now try without creating an object", function(){
		expect(testMe.dude()).toBe(true);
	});

	it ("should set latitude and longitude in cookies",function(){
		testMe.getLocation()
		expect(document.cookie).toContain("lat_lng");
	});
});