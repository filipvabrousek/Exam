
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
ctx.strokeStyle = "#BADA55"; 
ctx.lineJoin = "round"; // bevel, round, mittee
ctx.lineCap = "round"; // butt, round, square
ctx.lineWidth = 10;
    

let isDrawing = false;
let lastX = 0;
let lastY = 0;
let hue = 0;
let direction = true;
    
    
function draw(e){
    if (!isDrawing) return;
    ctx.strokeStyle = `hsl(${hue}, 100%, 50%)`; 
    ctx.beginPath();
    ctx.moveTo(lastX, lastY); // start from
    ctx.lineTo(e.offsetX, e.offsetY); // make line to position of the mouse
    ctx.stroke();
    [lastX, lastY] = [e.offsetX, e.offsetY];
    
    hue++;
    hue >= 360 ? hue = 0 : hue = hue;
    ctx.lineWidth >= 100 || ctx.lineWidth >= 1 ? direction != direction : direction = direction;
    direction ? ctx.lineWidth+=0.4 : ctx.lineWidth--;
}
    
    

canvas.addEventListener("mousedown", (e) => {
        isDrawing = true;
        [lastX, lastY] = [e.offsetX, e.offsetY];
    });

canvas.addEventListener("mousemove", draw);
canvas.addEventListener("mouseup", () => isDrawing = false);
canvas.addEventListener("mouseout", () => isDrawing = false);    

//ctx.globalCompositeOperation = "soft-light"; // copy, xor, multiply, screen, overlay, soft/hard-light
// <canvas width="800" height = "800"></canvas> border 1px solid #000

