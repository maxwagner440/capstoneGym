<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Running Workouts</title>
<meta name="description" content="Page description: running at an intermediate level via personal trainer">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
    <div class="flex-container">
        <div class="header-container">
            <img class="run-image" src="/Users/annakurchak/workspace/exercises/untitled folder/frontsquat.jpg" alt="Runner in Mountains" width="80%" height="30%">
                <div class="textOnPic"><b>My Current Workouts</b></div>
                <div class="homeOnPic"><a href="${home }" class="navBar-home"><b>Raise the Bar- Home</b></a></div>
        </div>
   

    <div class="flex-container-goals">
        <img class="goal-motivation" src="/Users/annakurchak/workspace/exercises/untitled folder/motivationForYou.jpg" alt="Self Motivation" width="15%" height="15%">
   
        <article class="article-goals">
            <h1>My Long-term Goals:</h1>
         <br>
         <div class="goals">
        <p>Living healthier</p>
        <p>Lowing body fat percentage</p>
        <p>Increasing strength</p>
        <p>Increasing my cardiovascular fitness.</p>
        </div>
        </article>

        <article class="article-sheets">
            <h2>My Current Workout Plan:</h2>
            <iframe src="google share link"></iframe>
            <p>*To work you must be logged in to your Google account*</p>
        </article>
    </div>

    <div class="googleSheet">

    </div>

<style>
.flex-container {
    display: -webkit-flex;
    display: flex;  
    -webkit-flex-flow: row wrap;
    flex-flow: row wrap;
    background-color: #e8eaee;
}
.flex-container > * {
    padding: 1px;
    -webkit-flex: 1 100%;
    flex: 1 100%;
    height: 7%;
}
.h1, .h2 {
    font-size: 30px;
    font-style: italic;
}
header {background: rgb(33, 33, 51);color:white;
    margin-bottom: 1.5em;
   
}
footer {background: rgb(46, 45, 58);color:white;}
.nav {background:#eee;}
.navBar-home {position:left:0;top:0;float:left!important;
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
.textOnPic {
    position: absolute;
    top: 60%;
    left: 50%;
    transform: translate(-50%, -50%);
    text-align: center;
    color: rgb(245, 245, 248);
    font-size: 50px;
}
.homeOnPic {
    position: absolute;
    bottom: 1.25em;
    left: 12%;
    font-size: 35px;
    color: #f5f7fa;
}
.run-image {
    margin: auto;
    padding-left: 8.5em;
}
/* .goal-motivation {
    display: inline-block;
    vertical-align: top;
    width: 25%;
} */
.flex-container-goals {
    display: -webkit-flex;
    display: flex;
    margin: 3em;
    justify-content: left;
}
.article-goals {
    display: -webkit-flex;
    display: flex;
    margin: 3em;
    justify-content: center;
}
.article-sheets{
    display: -webkit-flex;
    display: flex;
    margin: 3em;
    justify-content: right;
}
@media all and (min-width: 768px) {
    .nav {text-align:left;-webkit-flex: 1 auto;flex:1 auto;-webkit-order:1;order:1;}
    .article {-webkit-flex:5 0px;flex:5 0px;-webkit-order:2;order:2;}
    footer {-webkit-order:3;order:3;}}
</style>
 </div>
<div>
    <footer>Copyright &copy; Raise the Bar 2017</footer>
</div>

</body>
</html>