window.setTimeout(function() {
    alert('HAMMERTIME');
}, 5000);

// Asynchronous function

function hammerTime(time) {
    window.setTimeout(function() {
        alert(`${time} is hammertime!`)
    }, time);
}