var scrollTweetID = 1;
function scrollTweets(){

	tweet = "I'm dead!!";
	//append to tweet box
	$("#"+scrollTweetID).slideDown();
	
	//control box size
	if(scrollTweetID>5){
		$("#"+(scrollTweetID-5)).remove();
	}
	
	scrollTweetID++;
	$("#RecentTweets").prepend("<p id=\"" + scrollTweetID + "\">"+tweet+"</p>");
	//hscrollTweetIDe new tweet
	$("#"+scrollTweetID).hide();
	setTimeout(scrollTweets, 1000);
}
//run the bitch;
scrollTweets();
