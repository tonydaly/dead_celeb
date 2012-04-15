var appendTweet = function(deathTweet){
  var deathTweets = [];

  appendTweet = function(deathTweet){
    deathTweets.shift();
    deathTweets.push(deathTweet);

    var p= "<p>" + deathTweet + "</p>";
    $("#recent-deaths").prepend(p);
  };
};
