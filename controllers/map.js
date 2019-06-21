var https = require('follow-redirects').https;
var express=require("express");
var bodyParser=require('body-parser');
var router = express.Router();

var placeDetails = function() {
	this.places = [];
}

//Step 1: Get coordinates based on the entered zipcode.

router.get('/map',function getCoordinates(zipcode) {
	https.request({
		host: 'maps.googleapis.com',
		path: '/maps/api/geocode/json?address=' + zipcode + '&key=[AIzaSyAh-4rN7bJjUQv0U5DGk7qDpY6bIq8C2B0]',
		method: 'GET'},
		CoordinateResponse).end();


//Step 2: Find places within the specified radius, based on the coordinates provided by the getCoordinates function.

function placeSearch(latitude, longitude, radius) {
	https.request({
		host: 'maps.googleapis.com',
		path: '/maps/api/place/nearbysearch/json?location=' + latitude + ',' + longitude + '&radius=' + radius + '&type=restaurant&key=[AIzaSyAh-4rN7bJjUQv0U5DGk7qDpY6bIq8C2B0]',
		method: 'GET'},
		PlaceResponse).end();
}

function CoordinateResponse(response) {
	var data = "";
	var sdata = "";
	var latitude = "";
	var longitude = "";

	response.on('data', function(chunk) {
		data += chunk;
	});
	response.on('end', function() {
		sdata = JSON.parse(data);
		latitude = sdata.results[0].geometry.viewport.northeast.lat;
		longitude = sdata.results[0].geometry.viewport.northeast.lng;
		placeSearch(latitude, longitude, 50000);
	});
}

function PlaceResponse(response) {
	var p;
	var data = "";
	var sdata = "";
	var PD = new placeDetails();

	response.on('data', function(chunk) {
		data += chunk;
	});
	response.on('end', function() {
		sdata = JSON.parse(data);
		if (sdata.status === 'OK') {
			console.log('Status: ' + sdata.status);
			console.log('Results: ' + sdata.results.length);
			for (p = 0; p < sdata.results.length; p++) {
				PD.places.push(sdata.results[p]);
			}
			for (r = 0; r < sdata.results.length; r++) {
				console.log('----------------------------------------------');
				console.log(PD.places[r].name);
				console.log('Place ID (for Place Detail search on Google):' + PD.places[r].place_id);
				console.log('Rating: ' + PD.places[r].rating);
				console.log('Vicinity: ' + PD.places[r].vicinity);
			}
		} else {
			console.log(sdata.status);
		}
	});
}

getCoordinates(140301);
});
module.exports=router;