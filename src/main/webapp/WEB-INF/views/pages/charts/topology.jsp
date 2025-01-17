<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../../resources/dist/css/topology_style.css"/>

<body>
<table><tr><td>
  <svg width="100%" height="100%"></svg>
</td><td>
  <div class="infobox" id="infobox" >
      CLICK ON DEVICE FOR NEIGHBOR/INTERFACE INFORMATION
      <br>
      <a href="#"><img src="../../resources/dist/img/skb_logo.png" align="right" valign="top" width="350px" height="150px"></a>
  </div>
  <div class="infobox2" id="infobox2" >
  </div>  
</td></tr></table>
</body>

<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script>

// =============================
// PRINTING DEVICE DETAILS TABLE
// =============================

// ====================
// READING OF JSON FILE 
// ====================
function readTextFile(file, callback) {
    var rawFile = new XMLHttpRequest();
    rawFile.overrideMimeType("application/json");
    rawFile.open("GET", file, true);
    rawFile.onreadystatechange = function() {
        if (rawFile.readyState === 4 && rawFile.status == "200") {
            callback(rawFile.responseText);
        }
    }
    rawFile.send(null);
}

function OnClickDetails(deviceid){
  //alert("devicedetails: " + deviceid);
  //usage:
  
  // #############################
  // # READING NEIGHBORS         #
  // #############################  
  readTextFile("../../resources/python/neighborships.json", function(text){
      var data = JSON.parse(text);
      console.log(data); 
      console.log(deviceid);
      
      bFoundMatch = 0;  
      for (var key in data) {
        console.log("Key: " + key + " vs " + deviceid);

        if ((deviceid.localeCompare(key)) == 0){
          console.log("match!");
          bFoundMatch = 1;
          text = tableFromNeighbor(key,data);

          printToDivWithID("infobox","<h2><u>" + key + "</u></h2>" + text);          
        }
      }
      if (!(bFoundMatch)){
        warning_text = "<h4>The selected device id: ";
        warning_text+= deviceid;
        warning_text+= " is not in database!</h4>";
        warning_text+= "This is most probably as you clicked on edge node ";
        warning_text+= "that is not NETCONF data gathered, try clicking on its neighbors.";
        printToDivWithID("infobox",warning_text);
      }
  });  
  
  // ####################################
  // # READING NEIGHBOR-LESS INTERFACES #
  // ####################################
  readTextFile("../../resources/python/no_neighbor_interfaces.json", function(text){
      var data = JSON.parse(text);
      console.log(data); 
      console.log(deviceid);
      
      bFoundMatch = 0;
      for (var key in data) {
        console.log("Key: " + key + " vs " + deviceid);

        if ((deviceid.localeCompare(key)) == 0){
          console.log("match!");
          bFoundMatch = 1;
          text = tableFromUnusedInterfaces(key,data);
          printToDivWithID("infobox2","<font color=\"red\">Enabled Interfaces without LLDP Neighbor:</font><br>" + text);          
        }
      }
      if (!(bFoundMatch)){
        printToDivWithID("infobox2","");
      }      
  });  
}

// ####################################
// # using input parameters returns 
// # HTML table with these inputs
// ####################################
function tableFromUnusedInterfaces(key,data){
  text = "<table class=\"infobox2\">";
  text+= "<thead><th><u><h4>LOCAL INT.</h4></u></th><th><u><h4>DESCRIPTION</h4></u></th><th><u><h4>Bandwith</h4></u></th>";
  text+= "</thead>";
  
  for (var neighbor in data[key]) {
    text+= "<tr>";
    
    console.log("local_intf:" + data[key][neighbor]['local_intf']);
    text+= "<td>" + data[key][neighbor]['local_intf'] + "</td>";
    console.log("description:" + data[key][neighbor]['description']);
    text+= "<td>" + data[key][neighbor]['description'] + "</td>";
    console.log("actual_bandwith:" + data[key][neighbor]['actual_bandwith']);
    text+= "<td>" + data[key][neighbor]['actual_bandwith'] + "</td>";
    
    text+= "</tr>";
  }  
  
  text+= "</table>";
  
  return text; 
}

// ####################################
// # using input parameters returns 
// # HTML table with these inputs
// ####################################
function tableFromNeighbor(key,data){
  text = "<table class=\"infobox\">";
  text+= "<thead><th><u><h4>LOCAL INT.</h4></u></th><th><u><h4>NEIGHBOR</h4></u></th><th><u><h4>NEIGHBOR'S INT</h4></u></th>";
  text+= "</thead>";
  
  for (var neighbor in data[key]) {
    text+= "<tr>";
    
    console.log("local_intf:" + data[key][neighbor]['local_intf']);
    text+= "<td>" + data[key][neighbor]['local_intf'] + "</td>";
    console.log("neighbor_intf:" + data[key][neighbor]['neighbor_intf']);
    text+= "<td>" + data[key][neighbor]['neighbor'] + "</td>";
    console.log("neighbor:" + data[key][neighbor]['neighbor']);
    text+= "<td>" + data[key][neighbor]['neighbor_intf'] + "</td>";
    
    text+= "</tr>";
  }  
  
  text+= "</table>";
  
  return text; 
}

// ####################################
// # replaces content of specified DIV
// ####################################
function printToDivWithID(id,text){
  div = document.getElementById(id);
  div.innerHTML = text;
}

// ########
// # MAIN #
// ########
var svg = d3.select("svg"),
    //width = +svg.attr("width"),
    // height = +svg.attr("height");
    width  = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth,
    height = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight;  
    
    d3.select("svg").attr("height",height)
    d3.select("svg").attr("width",width*0.7)  

var color = d3.scaleOrdinal(d3.schemeCategory20);

var simulation = d3.forceSimulation()
    .force("link", d3.forceLink().id(function(d) { return d.id; }).distance(100).strength(0.001))
    .force("charge", d3.forceManyBody().strength(-200).distanceMax(500).distanceMin(50))
		.force("x", d3.forceX(function(d){
			if(d.group === "1"){
				return 5*(width*0.7)/6
			} else if (d.group === "2"){
				return 4*(width*0.7)/6
			} else if (d.group === "3"){
				return 3*(width*0.7)/6
			} else if (d.group === "4"){
				return 2*(width*0.7)/6  
			} else if (d.group === "5"){
				return 1*(width*0.7)/6                       
			} else {
				return 0*(width*0.7)/6 
			}
		 }).strength(1))
    .force("y", d3.forceY(height/2))
    .force("center", d3.forceCenter((width*0.7) / 2, height / 2))
    .force("collision", d3.forceCollide().radius(35));

// ######################################
// # Read graph.json and draw SVG graph #
// ######################################
d3.json("../../resources/python/graph.json", function(error, graph) {
  if (error) throw error;

  var link = svg.append("g")
    .selectAll("line")
    .data(graph.links)
    .enter().append("line")
      .attr("stroke", function(d) { return color(parseInt(d.value)); })
      .attr("stroke-width", function(d) { return Math.sqrt(parseInt(d.value)); });

  var node = svg.append("g")
    .attr("class", "nodes") 
    .selectAll("a")
    .data(graph.nodes)
    .enter().append("a")
      .attr("target", '_blank')
      .attr("xlink:href",  function(d) { return (window.location.href + '?device=' + d.id) });

  node.on("click", function(d,i){  
      d3.event.preventDefault(); 
      d3.event.stopPropagation(); 
      OnClickDetails(d.id);
      } 
  ); 

  node.call(d3.drag()
          .on("start", dragstarted)
          .on("drag", dragged)
          .on("end", dragended));  
          
  node.append("image")
      .attr("xlink:href", function(d) { return ("../../resources/dist/img/group" + d.group + ".png"); })
      .attr("width", 32)
      .attr("height", 32)
      .attr("x", - 16)
      .attr("y", - 16)      
      .attr("fill", function(d) { return color(d.group); }); 
      
  node.append("text")
      .attr("font-size", "0.8em") 
      .attr("dx", 12)
      .attr("dy", ".35em")
      .attr("x", +8)
      .text(function(d) { return d.id });                

  node.append("title")
      .text(function(d) { return d.id; });

  simulation
      .nodes(graph.nodes)
      .on("tick", ticked);

  simulation.force("link")
      .links(graph.links);

  function ticked() {
    link
        .attr("x1", function(d) { return d.source.x; })
        .attr("y1", function(d) { return d.source.y; })
        .attr("x2", function(d) { return d.target.x; })
        .attr("y2", function(d) { return d.target.y; });

    node
        .attr("transform", function(d) { return "translate(" + d.x + "," + d.y + ")"});        
  }
});

function dragstarted(d) {
  if (!d3.event.active) simulation.alphaTarget(0.3).restart();
  d.fx = d.x;
  d.fy = d.y;
}

function dragged(d) {
  d.fx = d3.event.x;
  d.fy = d3.event.y;
}

function dragended(d) {
  if (!d3.event.active) simulation.alphaTarget(0);
  d.fx = null;
  d.fy = null;
}
</script>