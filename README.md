<h1>HackedNews</h1>
<p>A HackerNews clone. The app lives here: http://hackednewscombinator.herokuapp.com</p>
<h3>App Design</h3>
<p>
    Since both comments and articles have votes, I used a polymorphic association to define the relationship between the
    three models. Comments and articles have many votes, and a vote belongs to both as votable. I used devise for user authentication.
</p>
<h3>Challenges of Scaling</h3>
<p>
    To support more traffic, I could scale up to more dynos on Heroku.
    For enhanced scalability, I would want to add redundant firewalls and more web servers.
    To support more complex features, I would want to think about features the users would value most and focus on adding one at a time.
    For example, next I might want to add the ability to reply to comments, and nest the replies under each comment so that each article show page appeared as more of a conversation.
    Once I had an active user base, I might want to think about letting users pay (using Stripe, of course) to feature a submitted article on the top of the home page for a specified time period.
</p>