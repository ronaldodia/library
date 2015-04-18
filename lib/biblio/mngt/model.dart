 
part of biblio_mngt; 
 
// lib/biblio/mngt/model.dart 
 
class MngtModel extends MngtEntries { 
 
  MngtModel(Model model) : super(model); 
 
  fromJsonToArticleEntry() { 
    fromJsonToEntry(biblioMngtArticleEntry); 
  } 
 
  fromJsonToUserEntry() { 
    fromJsonToEntry(biblioMngtUserEntry); 
  } 
 
  fromJsonToModel() { 
    fromJson(biblioMngtModel); 
  } 
 
  init() { 
    initUsers(); 
    initArticles(); 
  } 
 
  initArticles() {
    initUsers();
    var article1 = new Article(articles.concept); 
      article1.title = 'account'; 
      article1.author = 'ball'; 
      article1.category = 'baby'; 
      article1.quantity = 3734; 
      articles.add(article1); 
 
    var article1borrowing1 = new Borrowing(article1.borrowing.concept); 
      article1borrowing1.borrowingDate = new DateTime.now(); 
      article1borrowing1.returnDate = new DateTime.now(); 
    var article1borrowing1User = users.random(); 
    article1borrowing1.user = article1borrowing1User; 
    article1borrowing1.article = article1; 
    article1.borrowing.add(article1borrowing1); 
    article1borrowing1User.borrowing.add(article1borrowing1); 

    //article1borrowing1User.borrowing.add(article1borrowing1); 
 
    var article1borrowing2 = new Borrowing(article1.borrowing.concept); 
      article1borrowing2.borrowingDate = new DateTime.now(); 
      article1borrowing2.returnDate = new DateTime.now(); 
    var article1borrowing2User = users.random(); 
    article1borrowing2.user = article1borrowing2User; 
    article1borrowing2.article = article1; 
    article1.borrowing.add(article1borrowing2); 
    article1borrowing2User.borrowing.add(article1borrowing2); 
 
    var article2 = new Article(articles.concept); 
      article2.title = 'city'; 
      article2.author = 'month'; 
      article2.category = 'paper'; 
      article2.quantity = 2893; 
      articles.add(article2); 
 
    var article2borrowing1 = new Borrowing(article2.borrowing.concept); 
      article2borrowing1.borrowingDate = new DateTime.now(); 
      article2borrowing1.returnDate = new DateTime.now(); 
    var article2borrowing1User = users.random(); 
    article2borrowing1.user = article2borrowing1User; 
    article2borrowing1.article = article2; 
    article2.borrowing.add(article2borrowing1); 
    article2borrowing1User.borrowing.add(article2borrowing1); 
 
    var article2borrowing2 = new Borrowing(article2.borrowing.concept); 
      article2borrowing2.borrowingDate = new DateTime.now(); 
      article2borrowing2.returnDate = new DateTime.now(); 
    var article2borrowing2User = users.random(); 
    article2borrowing2.user = article2borrowing2User; 
    article2borrowing2.article = article2; 
    article2.borrowing.add(article2borrowing2); 
    article2borrowing2User.borrowing.add(article2borrowing2); 
 
    var article3 = new Article(articles.concept); 
      article3.title = 'plate'; 
      article3.author = 'price'; 
      article3.category = 'do'; 
      article3.quantity = 2740; 
      articles.add(article3); 
 
    var article3borrowing1 = new Borrowing(article3.borrowing.concept); 
      article3borrowing1.borrowingDate = new DateTime.now(); 
      article3borrowing1.returnDate = new DateTime.now(); 
    var article3borrowing1User = users.random(); 
    article3borrowing1.user = article3borrowing1User; 
    article3borrowing1.article = article3; 
    article3.borrowing.add(article3borrowing1); 
  article3borrowing1User.borrowing.add(article3borrowing1); 
 
    var article3borrowing2 = new Borrowing(article3.borrowing.concept); 
      article3borrowing2.borrowingDate = new DateTime.now(); 
      article3borrowing2.returnDate = new DateTime.now(); 
    var article3borrowing2User = users.random(); 
    article3borrowing2.user = article3borrowing2User; 
    article3borrowing2.article = article3; 
    article3.borrowing.add(article3borrowing2); 
    article3borrowing2User.borrowing.add(article3borrowing2); 
 
  } 
 
  initUsers() { 
    var user1 = new User(users.concept); 
      user1.email = 'tall'; 
      user1.firstName = 'slate'; 
      user1.lastName = 'interest'; 
      user1.phone = 'holiday'; 
      user1.privlege = 'hell'; 
      users.add(user1); 
 
    var user2 = new User(users.concept); 
      user2.email = 'software'; 
      user2.firstName = 'ball'; 
      user2.lastName = 'mile'; 
      user2.phone = 'tall'; 
      user2.privlege = 'plaho'; 
      users.add(user2); 
 
    var user3 = new User(users.concept); 
      user3.email = 'future'; 
      user3.firstName = 'test'; 
      user3.lastName = 'edition'; 
      user3.phone = 'room'; 
      user3.privlege = 'teaching'; 
      users.add(user3); 
 
  } 
 
  // added after code gen - begin 
 
  // added after code gen - end 
 
} 
 
