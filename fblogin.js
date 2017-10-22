window.fbAsyncInit = function() {
  FB.init({
    appId      : '1487988364623449',
    cookie     : true,
    xfbml      : true,
    version    : 'v2.10'
  });
  FB.AppEvents.logPageView();
};

FB.getLoginStatus(function(response) {
  if (response.status === 'connected') {
    console.log('Logged in.');
  }
  else {
    FB.login();
  }
  var access_token = FB.getAuthResponse()['accessToken'];
  window.location.replace("http://www.fabor.org/users/login?token="+ access_token);
});

// Load the SDK asynchronously
(function(d, s, id){
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) {return;}
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
