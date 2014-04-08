$(document).ready(function() {
  d3.selectAll("h1").style("color", function() {
    return "hsl(" + Math.random() * 360 + ",100%,50%)";
  });
  d3.selectAll("body").transition().duration(3000).style("background-color", function() {
    return "hsl(" + Math.random() * 360 + ",100%,50%)";
  });
});


