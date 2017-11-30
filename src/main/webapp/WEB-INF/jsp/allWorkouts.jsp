<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<style> 
.flex-container {
    display: -webkit-flex;
    display: flex;  
    -webkit-flex-flow: row wrap;
    flex-flow: row wrap;
    text-align: center;
    background-color: #a2b2c9;
}
.flex-container > * {
    padding: 15px;
    -webkit-flex: 1 100%;
    flex: 1 100%;
}
.box1 {
    background-color: #5d5f6b;
    color:#bec1cc;
    -webkit-flex: 1 45%;
    flex: 1 45%;
    margin-right:3em;
    margin-bottom: 0.75em;
}
.box2 {
    background-color: #576166;
    color: #bec1cc;
    -webkit-flex: 1 45%;
    flex: 1 45%;
    margin-bottom: 0.75em;
}
a {
    color: rgb(21, 29, 44); }
.article {
    text-align: center; 
}
header {background: rgb(35, 35, 58);color:white;
    margin-bottom: 1.5em;
}
footer {background: rgb(46, 45, 58);color:white;}
.nav {background:#eee;}
.navBar-home {position:left:0;top:0;float:left!important;
    color: #CCDDE3;
    font-size:20px!important;
    text-decoration: under-line;
}
.navBar-trainers {position:right:0;top:0;float:right!important;
    color: #CCDDE3;
    font-size:20px!important;
    text-decoration: under-line;
}
.nav ul {
    list-style-type: none;
    padding: 0;
}
.nav ul a {
    text-decoration: none;
}
@media all and (min-width: 768px) {
    .nav {text-align:left;-webkit-flex: 1 auto;flex:1 auto;-webkit-order:1;order:1;}
    .article {-webkit-flex:5 0px;flex:5 0px;-webkit-order:2;order:2;}
    footer {-webkit-order:3;order:3;}
}
</style>
</head>
<body>
        <div class="flex-container">
                <header>
                  <h1>Raise the Bar Workouts</h1>

                  <nav class="nav">
                        <ul>
                        <c:url value="/" var="home"/>
                          <li><a href="${home}" class="navBar-home">Home</a></li>
                          
                        </ul>
                    </nav>
                </header>
             <div class="box1">
                <article class="article">
                <c:url var="running" value="/runningWorkout"/>
                
                  <h1><a href="${running }">Running</a></h1>
                  <p>Running is second only to rowing for calories burned per hour.</p>
                  <p>Running outside is far superior to working out in a gym!!!</p>
                  <p><strong>It's the best!</strong></p>
                  <c:url value="/img/run.jpg" var="runPic"/>
                  <img class="run-pic" src="${runPic}" alt="running couple" width="200em" height="150em">
                </article>
            </div>
            <div class="box2">
                   <article class="article">
                        <h1><a href="">Weight Loss/Gain</a></h1>
                        <p>Stressful.</p>
                        <p>Good luck fighting your microbiome and coming out on top.</p>
                        <p><strong>It's not the best!</strong></p>
                        <c:url value="/img/weightLoss.jpg" var="weighttLoss"/>
                        <img class="weight-loss-pic" src="${weighttLoss}" alt="weight loss couple" width="200em" height="150em">
                </article>
            </div>
            <div class="box1">
                <article class="article">
                        <h1><a href="">Sports Performance</a></h1>
                        <p>Go team go!</p>
                        <p>Faster and stronger and better.</p>
                        <p><strong>It's second best!</strong></p>
                        c:url value="/img/sportsP.jpg" var="sportsPPic"/>
                        <img class="sports-perform-pic" src="${sportsPPic}" alt="sports performance" width="200em" height="150em">
                </article>
            </div>
            <div class="box2">
                <article class="article">
                        <h1><a href="">Cross-Fit</a></h1>
                        <p>Rhabdomyolysis</p>
                        <p>Break yourself with supervision, and then end up in the hospital with acute renal failure.</p>
                        <p><strong>It's not the best!</strong></p>
                        <c:url value="/img/crossFit.jpg" var="crossFitPic"/>
                        <img class="cross-fit-pic" src="${crossFitPic}" alt="crossFit tire" width="200em" height="150em">
                </article>
            </div> 
            <div class="box1">
                <article class="article">
                        <h1><a href="">Conditioning</a></h1>
                        <p>Maybe isn't fun.</p>
                        <p>It's boring.</p>
                        <p><strong>It's sort of maybe not the best!</strong></p>
                        <c:url value="/img/conditioning.jpg" var="conditioning"/>
                        <img class="conditioning-pic" src="${conditioning}" alt="conditioning" width="200em" height="150em">
                </article>
            </div>  
            <div class="box2">
                <article class="article">
                        <h1><a href="">Power Lifting</a></h1>
                        <p>Weight lifting isn't fun.</p>
                        <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                        <p><strong>It's not the best!</strong></p>
                        <c:url value="/img/powerLifting.jpg" var="powerLiftPic"/>
                        <img class="power-lift-pic" src="${powerLiftPic}" alt="power lift" width="200em" height="150em">
                </article>
            </div> 
            <div class="box1">
                <article class="article">
                        <h1><a href="">Olympic Lifting</a></h1>
                        <p>Weight lifting isn't fun.</p>
                        <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                        <p><strong>It's not the best!</strong></p>
                        <c:url value="/img/olympicLift.jpg" var="olympicLiftPic"/>
                        <img class="olympic-lift-pic" src="${olympicLiftPic}" alt="olympic lift" width="200em" height="150em">
                </article>
            </div>   
            <div class="box2">
                <article class="article">
                        <h1><a href="">Weight Lifting</a></h1>
                        <p>Weight lifting isn't fun.</p>
                        <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                        <p><strong>It's not the best!</strong></p>
                        <c:url value="/img/weightLifting.jpg" var="wtLiftingPic"/>
                        <img class="weight-lifting-pic" src="${wtLiftingPic}" alt="weight lifting" width="200em" height="150em">
                </article>
            </div>
            <div>
                <footer>Copyright &copy; Raise the Bar 2017</footer>
            </div>
              
                </body>
                </html>
