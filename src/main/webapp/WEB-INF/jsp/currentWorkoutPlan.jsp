<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Client Workout Plan</title>
<meta name="description" content="Page description: a client's personal workout page.">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="flex-container">

        <div class="header-container">
        	<c:url value="img/frontSquat.jpg" var="frontSquat"/>
            <img class="lift-image" src="${frontSquat}" alt="Shirtless man front squatting" width="80%" height="30%">
                <div class="textOnPic"><b>My Current Workouts</b></div>
                <c:url value="/" var="home"/>
                <div class="homeOnPic"><a href="${home }" class="navBar-home"><b>Raise the Bar- Home</b></a></div>
        </div>

    <div class="flex-container-goals">
    <c:url value="motivationForYou.jpg" var="motivationForYou"/>
        <img class="goal-motivation" src="${ motivationForYou}" alt="Self Motivation" width="15%" height="15%">
   
        <article class="article-goals">
            <h1>My Long-term Goals:</h1>
            <br>
        </article>
            <div class="goals">
                <p>Living healthier</p>
                <p>Lowing body fat percentage</p>
                <p>Increasing strength</p>
                <p>Increasing my cardiovascular fitness.</p>
            </div>
    </div>

    <div class="flex-container-sheets">
            <div class="sheets-title">
                <h2>My Current Workout Plan:</h2>
            </div>  
            <div class="google-sheet">
                <iframe src="https://docs.google.com/spreadsheets/d/1K0UAI9iTyp-oZ4bFHkhB80zNVbuH9cHLB_6wd_pOXEU/edit?usp=sharing" alt="Google Sheet" width="100%" height="100%"></iframe>
            </div>
            <div class="flex-container-sheets-text">
                <p>*To work you must be logged in to your Google account*</p>
            </div>
    </div>
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
footer {background: rgb(46, 45, 58);color:white;}
.lift-image {
    margin: auto;
    padding-left: 8.5em;
}
.nav {background:#eee;}
.navBar-home {position:left:0;top:0;float:left!important;
    color: #CCDDE3;
    font-size:20px!important;
    text-decoration: under-line;}
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
.flex-container-goals {
    display: -webkit-flex;
    flex-direction: row;
    margin: 3em;
    justify-content: left;
    background-color: #5d5e61;
    margin: 1em;
   
}
.article-goals {
    display: -webkit-flex;
    margin: 3em;
    align-items: center;
    font-size: 20px;
}
.goals{
    display: -webkit-flex;
    flex-direction: column;
    align-items: left;
    font-size: 20px; 
    color: #eee;
    font-style: italic;
}
.flex-container-sheets{
    margin: 3em;
    background-color: #5d5e61;
    margin-left: 10em;
    margin-right: 10em;
    height: 32em;
    justify-content: center;
    align-items: center;
    align-content: center;
    padding-left: 15em;
    
   
}
.google-sheet{
    display: -webkit-flex;
    width: 70%;
    height: 75%; 
}
.flex-container-sheets-text{
    align-items: center;
    color: #F7FAFB;
}
.sheets-title {
    align-items: center;
    font-size: 20px;
    margin: .5em;
    color: #000000;
}
@media all and (min-width: 768px) {
    .nav {text-align:left;-webkit-flex: 1 auto;flex:1 auto;-webkit-order:1;order:1;}
    .article {-webkit-flex:5 0px;flex:5 0px;-webkit-order:2;order:2;}
    footer {-webkit-order:3;order:3;}}
</style>


<div>
    <footer>Copyright &copy; Raise the Bar 2017</footer>
</div>

</body>
</html>