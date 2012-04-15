var appendTweet = function(deathTweet){
  var deathTweets = [];

  appendTweet = function(deathTweet){
    deathTweets.shift();
    deathTweets.push(deathTweet);

    var p= "<p>" + deathTweet + "</p>";
    $("#recent-deaths").prepend(p);
  };
  appendTweet(deathTweet);
};

var deadCeleb = function(celeb){
  var div = "<div><a href='" + celeb.url + "'>" + celeb.name + "</a></div>";


  $(".name").append(div);
};
