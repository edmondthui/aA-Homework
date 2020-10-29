console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
    url: 'http://api.openweathermap.org/data/2.5/weather?q=new%20york,US&appid=6e90d582ac9b4dec6b8fa64996e941f7',
    type: 'GET',
    success: function(data) {
        console.log(data);
    }
});
// Add another console log here, outside your AJAX request
console.log("hello");
