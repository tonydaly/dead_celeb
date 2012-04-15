function getTweets(){
	var pusher = new Pusher('3e82ccea5da2b7f29a25');
	var channel = pusher.subscribe('dead_celebs');
	pusher.bind_all(dumpMessage);
}

var scrollTweetID = 1;
function scrollTweets(){
	//fetch tweet
	deathTweet = "Justin bieber is dead!!";
	fatalatyTweet = "Kanye West";
	wishTweet = "Donald Trump";
	
	if(scrollTweetID>=3){	
		//slide down
		$("#"+scrollTweetID).slideDown();
		$("#"+(scrollTweetID+1)).slideDown();
		$("#"+(scrollTweetID+2)).slideDown();
	}
	
	//control box size
	if(scrollTweetID>15){
		$("#"+(scrollTweetID-15)).remove();
		$("#"+(scrollTweetID-14)).remove();
		$("#"+(scrollTweetID-13)).remove();
	}
	
	scrollTweetID = scrollTweetID + 3 ;
	
	$("#RecentDeaths").prepend("<p id=\"" + scrollTweetID + "\">"+deathTweet+"</p>");
	$("#fatalHopefulls").prepend("<p id=\"" + (scrollTweetID +1) + "\">"+fatalatyTweet+"</p>");
	$("#wishList").prepend("<p id=\"" + (scrollTweetID +2) + "\">"+wishTweet+"</p>");
	
	//hscrollTweetIDe new tweet
	$("#"+scrollTweetID).hide();
	$("#"+(scrollTweetID+1)).hide();
	$("#"+(scrollTweetID+2)).hide();	
	setTimeout(scrollTweets, 1000);
}
function dumpMessage(data){
	alert(data.tweet);
}
//run the bitch;
scrollTweets();
getTweets();
