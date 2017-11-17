 <div class="form">
      
      <ul class="tab-group">
        <li class="tab active"><a href="#signup">Sign Up</a></li>
        <li class="tab"><a href="#login">Log In</a></li>
      </ul>
      
      <div class="tab-content">
        <div id="signup">   
          <h1>Sign Up for Free</h1>
          
          <form action="/" method="post">
          
          <div class="top-row">
            <div class="field-wrap">
              <!-- <label>
                First Name<span class="req">*</span>
              </label> -->
              <input type="text" required autocomplete="off" placeholder="First Name"/>
            </div>
        
            <div class="field-wrap">
              <!-- <label>
                Last Name<span class="req">*</span>
              </label> -->
              <input type="text"required autocomplete="off" placeholder="Last Name"/>
            </div>
          </div>

          <div class="field-wrap">
            <!-- <label>
              Email Address<span class="req">*</span>
            </label> -->
            <input type="email"required autocomplete="off" placeholder="Email Address"/>
          </div>
          
          <div class="field-wrap">
            <!-- <label>
              Set A Password<span class="req">*</span>
            </label> -->
            <input type="password"required autocomplete="off" placeholder="Set Password"/>
          </div>
          
          <button type="submit" class="button button-block"/>Get Started</button>
          
          </form>

        </div>
        
        <div id="login">   
          <h1>Welcome Back!</h1>
          
          <form action="/" method="post">
          
            <div class="field-wrap">
            <!-- <label>
              Email Address<span class="req">*</span>
            </label> -->
            <input type="email"required autocomplete="off" placeholder="Email Address"/>
          </div>
          
          <div class="field-wrap">
            <!-- <label>
              Password<span class="req">*</span>
            </label> -->
            <input type="password"required autocomplete="off" placeholder="Password"/>
          </div>
          
          <p class="forgot"><a href="#">Forgot Password?</a></p>
          
          <button class="button button-block"/>Log In</button>
          
          </form>

        </div>
        
      </div><!-- tab-content -->
      
</div> <!-- /form -->