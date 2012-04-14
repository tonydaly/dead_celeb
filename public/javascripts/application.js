var scrollTweets = function(deathTweet){
  var deathTweets = [];

  scrollTweets = function(deathTweet){
    deathTweets.shift();
    deathTweets.push(deathTweet);

    var p= "<p>" + deathTweet + "</p>";
    $("#recent-deaths").prepend(p);
  };
};
