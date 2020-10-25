document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById("mycanvas");
    canvas.height = 500;
    canvas.width = 500;
    let ctx = canvas.getContext('2d');
    ctx.fillStyle = "red";
    ctx.fillRect(0,0,500,500);
    ctx.beginPath();
    ctx.arc(250,250,100,2*Math.PI,0);
    ctx.lineWidth = 5;
    ctx.stroke();
    ctx.fillStyle = "green";
    ctx.fill();

    ctx.beginPath();
    ctx.moveTo(250,250);
    ctx.lineTo(150,250);
    ctx.lineTo(250,350);
    ctx.lineTo(350,250);
    ctx.lineTo(250,250);

    ctx.fillStyle = "white";
    ctx.fill();

});
