<!DOCTYPE html>
<html>
<head>
<style> 
.flex-container {
    display: -webkit-flex;
    display: flex;  
    -webkit-flex-flow: row wrap;
    flex-flow: row wrap;
    text-align: center;
}
.flex-container > * {
    padding: 15px;
    -webkit-flex: 1 100%;
    flex: 1 100%;
}
a {
  
    color: rgb(66, 75, 156);
}
.article,/*  .article2, .article3, .article4, .article5, .article6, .article7, .article8 */{
    text-align: left;
}
header {background: rgb(48, 48, 100);color:white;}
footer {background: rgb(46, 45, 58);color:white;}
.nav {background:#eee;}
.navBar-home {position:left:0;top:0;float:left!important;
    color: #CCDDE3;
    font-size:18px!important;
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
                          <li><a href="#home" class="navBar-home">Home</a></li>
                          <li><a href="trainers" class="navBar-trainers">Trainers</a></li>
                        </ul>
                    </nav>

                </header>
 
                <article class="article">
                  <h1><a href="">Running</a></h1>
                  <p>Running is second only to rowing for calories burned per hour.</p>
                  <p>Running outside is far superior to working out in a gym!!!</p>
                  <p><strong>It's the best!</strong></p>
                </article>
            
                   <article class="article2">
                        <h1><a href="">Weight Loss/Gain</a></h1>
                        <p>Stressful.</p>
                        <p>Good luck fighting your microbiome and coming out on top.</p>
                        <p><strong>It's not the best!</strong></p>
                </article>
           
                <article class="article3">
                        <h1><a href="">Sports Performance</a></h1>
                        <p>Go team go!</p>
                        <p>Faster and stronger and better.</p>
                        <p><strong>It's second best!</strong></p>
                </article>
               
                <article class="article4">
                        <h1><a href="">Cross-Fit</a></h1>
                        <p>Rhabdomyosis</p>
                        <p>Break yourself with supervision, and then end up in the hospital.</p>
                        <p><strong>It's not the best!</strong></p>
                </article>
             
                        <article class="article5">
                                <h1><a href="">Conditioning</a></h1>
                                <p>Maybe isn't fun.</p>
                                <p>It's boring.</p>
                                <p><strong>It's sort of maybe not the best!</strong></p>
                        </article>
                
                        <article class="article6">
                                <h1><a href="">Power Lifting</a></h1>
                                <p>Weight lifting isn't fun.</p>
                                <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                                <p><strong>It's not the best!</strong></p>
                        </article>
            
                        <article class="article7">
                                <h1><a href="">Olympic Lifting</a></h1>
                                <p>Weight lifting isn't fun.</p>
                                <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                                <p><strong>It's not the best!</strong></p>
                        </article>
                
                        <article class="article8">
                                <h1><a href="">Weight Lifting</a></h1>
                                <p>Weight lifting isn't fun.</p>
                                <p>Staring at yourself in a mirrow and grunting while picking up heavy weights is boring.</p>
                                <p><strong>It's not the best!</strong></p>
                        </article>
            
                <footer>Copyright &copy; Raise the Bar 2017</footer>
                </div>
              
                </body>
                </html>
