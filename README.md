<h1>HackedNews</h1>
<p>A HackerNews clone. The app lives here: http://hackednewscombinator.herokuapp.com</p>
<h3>App Design</h3>
<p>
    Since both comments and articles have votes, I used a polymorphic association to define the relationship between the
    three models. Comments and articles have many votes, and a vote belongs to both as votable. I used devise for user authentication.
</p>
<h3>Challenges of Scaling</h3>
<p>
    To support more traffic, I could scale up to more dynos on Heroku. For enhanced scalability, I would want to add redundant firewalls and more web servers. To support more complex features,
</p>