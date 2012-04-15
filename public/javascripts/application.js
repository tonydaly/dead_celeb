var appendTweet = function(deathTweet){
  var deathTweets = [];

  appendTweet = function(deathTweet){
    deathTweets.shift();
    deathTweets.push(deathTweet.tweet);

    var html = "<div class='tweet span4'><div class='span1 image'>" + "<img src=" + deathTweet.user.profile + ">" + "</div><div class='content span3'><h1>" + deathTweet.user.name + "</h1><p>" + deathTweet.tweet + "</p></div></div>"
    $("#recent-deaths").prepend(html);
  };
  appendTweet(deathTweet);
};

var deadCeleb = function(celeb){
  var div = "<div><a href='" + celeb.url + "'>" + celeb.name + "</a></div>";


  $(".name").append(div);
};
