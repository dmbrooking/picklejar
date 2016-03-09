class PagesController < ApplicationController
  skip_before_action :authenticate_user!


  def index
    random_quote = quotes.sample
    @quote = random_quote[0]
    @attribution = random_quote[1]
  end

  def quotes
    [
      ['You have to balance, but you can be aggressive as a chef. It benefits the food. You have to be passionate. You can\'t be angry cooking.', 'Marcus Samuelsson'],
      ['If you\'re not the one cooking, stay out of the way and compliment the chef.', 'Michael Strahan'],
      ['I think careful cooking is love, don\'t you? The loveliest thing you can cook for someone who\'s close to you is about as nice a valentine as you can give.', 'Julia Child'],
      ['In France, cooking is a serious art form and a national sport.', 'Julia Child'],
      ['Cooking and gardening involve so many disciplines: math, chemistry, reading, history.', 'David Chang'],
      ['When it comes to cooking and eating, I always try to preach that life is about moderation. Even if I\'m having beef for dinner, it\'s probably going to be a 3-4 ounce portion with heaps and heaps of vegetables.', 'Michael Symon'],
      ['For me, cooking is an expression of the land where you are and the culture of that place.', 'Wolfgang Puck'],
      ['Cooking is like painting or writing a song. Just as there are only so many notes or colors, there are only so many flavors - it\'s how you combine them that sets you apart.', 'Wolfgang Puck'],
      ['I don\'t like gourmet cooking or \'this\' cooking or \'that\' cooking. I like good cooking.', 'James Beard'],
      ['From a young age, I understood the idea of balanced flavor - the reason you put ketchup on a hamburger. I was that kid who wouldn\'t eat something if there was something missing. I never really understood it until I began cooking professionally, balancing acids, sweets, spicy flavors and fat.', 'Michael Mina'],
      ['Once you understand the foundations of cooking - whatever kind you like, whether it\'s French or Italian or Japanese - you really don\'t need a cookbook anymore.', 'Thomas Keller']
    ]
  end

end
