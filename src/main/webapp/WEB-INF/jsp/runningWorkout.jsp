<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<title>Running Workouts</title>
<meta name="description" content="Page description: running at an intermediate level via personal trainer">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style> 
@import url("font-awesome.min.css");
@import url("https://fonts.googleapis.com/css?family=Lato:400,400italic,700,700italic|Source+Code+Pro:400");
.flex-container {
    display: -webkit-flex;
    display: flex;  
    -webkit-flex-flow: row wrap;
    flex-flow: row wrap;
    background-color: #274066;
    text-align: center;
}
.flex-container > * {
    padding: 1px;
    -webkit-flex: 1 100%;
    flex: 1 100%;
    height: 7%;
}
.h1 {font-size: 30px;}
header {background: rgb(33, 33, 51);color:white;
    margin-bottom: 1.5em;
   
}
footer {background: rgb(46, 45, 58);color:white;}
.nav {background:#eee;}
.navBar-home {position:left:0;top:0;float:left!important;
    color: #CCDDE3;
    font-size:20px!important;
    text-decoration: under-line;}
.navBar-trainers {position:right:0;top:0;float:right!important;
    color: #CCDDE3;
    font-size:20px!important;
    text-decoration: under-line;}
.nav ul {
    list-style-type: none;
    padding: 0;}
.nav ul a {text-decoration: none;}
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section {
        display: block;
    }
@media all and (min-width: 768px) {
    .nav {text-align:left;-webkit-flex: 1 auto;flex:1 auto;-webkit-order:1;order:1;}
    .article {-webkit-flex:5 0px;flex:5 0px;-webkit-order:2;order:2;}
    footer {-webkit-order:3;order:3;}}
.titleDiv{
    /* display: -webkit-flex;
    display: flex;   */
    text-align: center; /* doesn't work */
    background-color: #7e98be;
    padding: 1em;
    width: 80%;
    margin: auto;
}
.header-container{
    position: relative;
    
}
.textOnPic {
    position: absolute;
    top: 22%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: rgb(23, 23, 36);
    font-size: 50px;
}
.homeOnPic {
    position: absolute;
    bottom: 8px;
    left: 15%;
    font-size: 30px;
}
.trainersOnPic {
    position: absolute;
    bottom: 8px;
    right: 15%;
    font-size: 30px;
}
.fiveK-container{
    background-color: #bdbfc2;
    padding: 0em;
    width: 60%;
    margin: auto;
    font-size: 18px;
}
.tenK-container{
    background-color: #bdbfc2;
    padding: 0em;
    width: 60%;
    margin: auto;
}
.halfMara-container{
    background-color: #bdbfc2;
    padding: 0em;
    width: 60%;
    margin: auto;
}
.Mara-container{
    background-color: #bdbfc2;
    padding: 0em;
    width: 60%;
    margin: auto;
}
</style>
</head>

<body>
<div class="flex-container">

    <div class="header-container">
    	<c:url value="/img/runnerMtns.jpg" var="runnerMtns"/>
        <img class="run-image" src="${runnerMtns}" alt="Runner in Mountains" width="80%" height="30%">
            <div class="textOnPic"><b>Raise the Bar Running Workouts</b></div>
            <c:url value="/" var="home"/>
            <div class="homeOnPic"><a href="${home}" class="navBar-home"><b>Raise the Bar- Home</b></a></div>
            <div class="trainersOnPic"><li><a href="trainers" class="navBar-trainers">Trainers</a></li></div>
                </div>
                </header>

<section id="one">
    <div class="titleDiv">
        <h2>Running</h2>
            <p>Running: Each plan is tailored by a trainer to suit your starting fitness levels and desired goals.</p>
            <p>Below, starting from a 5k, and finishing at a marathon, are an example of the training programs a trainer would modify to suit your abilities.</p>
    </div>
</section>

    <section id="two">
                <div class="fiveK-container">
                    <h3>Training for a 5K</h3>
                        <p>It is a super short race. Barley pace yourself, and just run as fast as you can.</p>
                <c:url value="/img/5k.jpg" var="fivekPic"/>
                <img class="5k-training" src="${fivekPic}" alt="5K training program" width="50%" height="60%">
                </div>
    </section>
        
    <section id="three">
        <div class="tenK-container">
            <h3>Training for a 10K</h3>
            <p>This race requires a bit of a strategy. Pace yourself significantly at the beginning, but still just run as fast as you can.</p>
            <c:url value="/img/10k.jpg" var="tenkPic"/>
            <img class="tenk-training" src="${tenkPic }" alt="10K training program" width="50%" height="60%">
        </div>
    </section>

    <section id="four">
            <div class="halfMara-container">
                <h3>Training for a half-marathon</h3>
                <p>This race requires more strategy. Pace yourself significantly at the beginning, but still just run as fast as you can.</p>
                <c:url value="/img/half-mara.jpg" var="halfMaraPic"/>
                <img class="halfMara-training" src="${halfMaraPic}" alt="half-marathon training program" width="60%" height="70%">
            </div>
    </section>
    <section id="five">
            <div class="Mara-container">
                <h3>Training for a marathon</h3>
                <p>This race requires a lot of a strategy all revolving around not dying. Pace yourself significantly and don't die.</p>
                <c:url value="/img/marathon.jpg" var="marathonPic"/>
                <img class="Mara-training" src="${marathonPic }" alt="marathon training program" width="60%" height="70%">
            </div>
    </section>
 
    <div>
        <footer>Copyright &copy; Raise the Bar 2017</footer>
    </div>

</body>
</html>