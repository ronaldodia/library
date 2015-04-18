 
// test/biblio/mngt/biblio_mngt_article_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_mngt/biblio_mngt.dart"; 
 
testBiblioMngtArticles( 
    BiblioDomain biblioDomain, MngtModel mngtModel, Articles articles) { 
  DomainSession session; 
  group("Testing Biblio.Mngt.Article", () { 
    session = biblioDomain.newSession();  
    expect(mngtModel.isEmpty, isTrue); 
    setUp(() { 
      mngtModel.init(); 
    }); 
    tearDown(() { 
      mngtModel.clear(); 
    }); 
 
    test("Not empty model", () { 
      expect(mngtModel.isEmpty, isFalse); 
      expect(articles.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      mngtModel.clear(); 
      expect(mngtModel.isEmpty, isTrue); 
      expect(articles.isEmpty, isTrue); 
      expect(articles.errors.isEmpty, isTrue); 
    }); 
 
    test("From model to JSON", () { 
      var json = mngtModel.toJson(); 
      expect(json, isNotNull); 
 
      print(json); 
      //mngtModel.displayJson(); 
      //mngtModel.display(); 
    }); 
 
    test("From JSON to model", () { 
      var json = mngtModel.toJson(); 
      mngtModel.clear(); 
      expect(mngtModel.isEmpty, isTrue); 
      mngtModel.fromJson(json); 
      expect(mngtModel.isEmpty, isFalse); 
 
      mngtModel.display(); 
    }); 
 
    test("From model entry to JSON", () { 
      var json = mngtModel.fromEntryToJson("Article"); 
      expect(json, isNotNull); 
 
      print(json); 
      //mngtModel.displayEntryJson("Article"); 
      //mngtModel.displayJson(); 
      //mngtModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = mngtModel.fromEntryToJson("Article"); 
      articles.clear(); 
      expect(articles.isEmpty, isTrue); 
      mngtModel.fromJsonToEntry(json); 
      expect(articles.isEmpty, isFalse); 
 
      articles.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add article required error", () { 
      var articleConcept = articles.concept; 
      var articleCount = articles.length; 
      var article = new Article(articleConcept); 
      var added = articles.add(article); 
      expect(added, isFalse); 
      expect(articles.length, equals(articleCount)); 
      expect(articles.errors.length, greaterThan(0)); 
      expect(articles.errors.toList()[0].category, equals("required")); 
 
      articles.errors.display(title: "Add article required error"); 
    }); 
 
    test("Add article unique error", () { 
      // no id attribute 
    }); 
 
    test("Not found article by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var article = articles.singleWhereOid(dartlingOid); 
      expect(article, isNull); 
    }); 
 
    test("Find article by oid", () { 
      var randomArticle = articles.random(); 
      var article = articles.singleWhereOid(randomArticle.oid); 
      expect(article, isNotNull); 
      expect(article, equals(randomArticle)); 
    }); 
 
    test("Find article by attribute id", () { 
      // no id attribute 
    }); 
 
    test("Find article by required attribute", () { 
      var randomArticle = articles.random(); 
      var article = 
          articles.firstWhereAttribute("title", randomArticle.title); 
      expect(article, isNotNull); 
      expect(article.title, equals(randomArticle.title)); 
    }); 
 
    test("Find article by attribute", () { 
      var randomArticle = articles.random(); 
      var article = 
          articles.firstWhereAttribute("quantity", randomArticle.quantity); 
      expect(article, isNotNull); 
      expect(article.quantity, equals(randomArticle.quantity)); 
    }); 
 
    test("Select articles by attribute", () { 
      var randomArticle = articles.random(); 
      var selectedArticles = 
          articles.selectWhereAttribute("quantity", randomArticle.quantity); 
      expect(selectedArticles.isEmpty, isFalse); 
      selectedArticles.forEach((se) => 
          expect(se.quantity, equals(randomArticle.quantity))); 
 
      //selectedArticles.display(title: "Select articles by quantity"); 
    }); 
 
    test("Select articles by required attribute", () { 
      var randomArticle = articles.random(); 
      var selectedArticles = 
          articles.selectWhereAttribute("title", randomArticle.title); 
      expect(selectedArticles.isEmpty, isFalse); 
      selectedArticles.forEach((se) => 
          expect(se.title, equals(randomArticle.title))); 
 
      //selectedArticles.display(title: "Select articles by title"); 
    }); 
 
    test("Select articles by attribute, then add", () { 
      var randomArticle = articles.random(); 
      var selectedArticles = 
          articles.selectWhereAttribute("title", randomArticle.title); 
      expect(selectedArticles.isEmpty, isFalse); 
      expect(selectedArticles.source.isEmpty, isFalse); 
      var articlesCount = articles.length; 
 
      var article = new Article(articles.concept); 
      article.title = 'room'; 
      article.author = 'autobus'; 
      article.category = 'sin'; 
      article.quantity = 7860; 
      var added = selectedArticles.add(article); 
      expect(added, isTrue); 
      expect(articles.length, equals(++articlesCount)); 
 
      //selectedArticles.display(title: 
      //  "Select articles by attribute, then add"); 
      //articles.display(title: "All articles"); 
    }); 
 
    test("Select articles by attribute, then remove", () { 
      var randomArticle = articles.random(); 
      var selectedArticles = 
          articles.selectWhereAttribute("title", randomArticle.title); 
      expect(selectedArticles.isEmpty, isFalse); 
      expect(selectedArticles.source.isEmpty, isFalse); 
      var articlesCount = articles.length; 
 
      var removed = selectedArticles.remove(randomArticle); 
      expect(removed, isTrue); 
      expect(articles.length, equals(--articlesCount)); 
 
      randomArticle.display(prefix: "removed"); 
      //selectedArticles.display(title: 
      //  "Select articles by attribute, then remove"); 
      //articles.display(title: "All articles"); 
    }); 
 
    test("Sort articles", () { 
      // no id attribute 
      // add compareTo method in the specific Article class 
      /* 
      articles.sort(); 
 
      //articles.display(title: "Sort articles"); 
      */ 
    }); 
 
    test("Order articles", () { 
      // no id attribute 
      // add compareTo method in the specific Article class 
      /* 
      var orderedArticles = articles.order(); 
      expect(orderedArticles.isEmpty, isFalse); 
      expect(orderedArticles.length, equals(articles.length)); 
      expect(orderedArticles.source.isEmpty, isFalse); 
      expect(orderedArticles.source.length, equals(articles.length)); 
      expect(orderedArticles, isNot(same(articles))); 
 
      //orderedArticles.display(title: "Order articles"); 
      */ 
    }); 
 
    test("Copy articles", () { 
      var copiedArticles = articles.copy(); 
      expect(copiedArticles.isEmpty, isFalse); 
      expect(copiedArticles.length, equals(articles.length)); 
      expect(copiedArticles, isNot(same(articles))); 
      copiedArticles.forEach((e) => 
        expect(e, equals(articles.singleWhereOid(e.oid)))); 
 
      //copiedArticles.display(title: "Copy articles"); 
    }); 
 
    test("True for every article", () { 
      expect(articles.every((e) => e.title != null), isTrue); 
    }); 
 
    test("Random article", () { 
      var article1 = articles.random(); 
      expect(article1, isNotNull); 
      var article2 = articles.random(); 
      expect(article2, isNotNull); 
 
      //article1.display(prefix: "random1"); 
      //article2.display(prefix: "random2"); 
    }); 
 
    test("Update article id with try", () { 
      // no id attribute 
    }); 
 
    test("Update article id without try", () { 
      // no id attribute 
    }); 
 
    test("Update article id with success", () { 
      // no id attribute 
    }); 
 
    test("Update article non id attribute with failure", () { 
      var randomArticle = articles.random(); 
      var beforeUpdateValue = randomArticle.title; 
      var afterUpdateEntity = randomArticle.copy(); 
      afterUpdateEntity.title = 'text'; 
      expect(afterUpdateEntity.title, equals('text')); 
      // articles.update can only be used if oid, code or id is set. 
      expect(() => articles.update(randomArticle, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomArticle = articles.random(); 
      randomArticle.display(prefix:"before copy: "); 
      var randomArticleCopy = randomArticle.copy(); 
      randomArticleCopy.display(prefix:"after copy: "); 
      expect(randomArticle, equals(randomArticleCopy)); 
      expect(randomArticle.oid, equals(randomArticleCopy.oid)); 
      expect(randomArticle.code, equals(randomArticleCopy.code)); 
      expect(randomArticle.title, equals(randomArticleCopy.title)); 
      expect(randomArticle.author, equals(randomArticleCopy.author)); 
      expect(randomArticle.category, equals(randomArticleCopy.category)); 
      expect(randomArticle.quantity, equals(randomArticleCopy.quantity)); 
 
    }); 
 
    test("New article action undo and redo", () { 
      var articleConcept = articles.concept; 
      var articleCount = articles.length; 
          var article = new Article(articles.concept); 
      article.title = 'phone'; 
      article.author = 'heating'; 
      article.category = 'car'; 
      article.quantity = 6346; 
      articles.add(article); 
      expect(articles.length, equals(++articleCount)); 
      articles.remove(article); 
      expect(articles.length, equals(--articleCount)); 
 
      var action = new AddAction(session, articles, article); 
      action.doit(); 
      expect(articles.length, equals(++articleCount)); 
 
      action.undo(); 
      expect(articles.length, equals(--articleCount)); 
 
      action.redo(); 
      expect(articles.length, equals(++articleCount)); 
    }); 
 
    test("New article session undo and redo", () { 
      var articleConcept = articles.concept; 
      var articleCount = articles.length; 
          var article = new Article(articles.concept); 
      article.title = 'call'; 
      article.author = 'hall'; 
      article.category = 'bird'; 
      article.quantity = 9321; 
      articles.add(article); 
      expect(articles.length, equals(++articleCount)); 
      articles.remove(article); 
      expect(articles.length, equals(--articleCount)); 
 
      var action = new AddAction(session, articles, article); 
      action.doit(); 
      expect(articles.length, equals(++articleCount)); 
 
      session.past.undo(); 
      expect(articles.length, equals(--articleCount)); 
 
      session.past.redo(); 
      expect(articles.length, equals(++articleCount)); 
    }); 
 
    test("Article update undo and redo", () { 
      var article = articles.random(); 
      var action = new SetAttributeAction(session, article, "title", 'dvd'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(article.title, equals(action.before)); 
 
      session.past.redo(); 
      expect(article.title, equals(action.after)); 
    }); 
 
    test("Article action with multiple undos and redos", () { 
      var articleCount = articles.length; 
      var article1 = articles.random(); 
 
      var action1 = new RemoveAction(session, articles, article1); 
      action1.doit(); 
      expect(articles.length, equals(--articleCount)); 
 
      var article2 = articles.random(); 
 
      var action2 = new RemoveAction(session, articles, article2); 
      action2.doit(); 
      expect(articles.length, equals(--articleCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(articles.length, equals(++articleCount)); 
 
      session.past.undo(); 
      expect(articles.length, equals(++articleCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(articles.length, equals(--articleCount)); 
 
      session.past.redo(); 
      expect(articles.length, equals(--articleCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var articleCount = articles.length; 
      var article1 = articles.random(); 
      var article2 = articles.random(); 
      while (article1 == article2) { 
        article2 = articles.random();  
      } 
      var action1 = new RemoveAction(session, articles, article1); 
      var action2 = new RemoveAction(session, articles, article2); 
 
      var transaction = new Transaction("two removes on articles", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      articleCount = articleCount - 2; 
      expect(articles.length, equals(articleCount)); 
 
      articles.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      articleCount = articleCount + 2; 
      expect(articles.length, equals(articleCount)); 
 
      articles.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      articleCount = articleCount - 2; 
      expect(articles.length, equals(articleCount)); 
 
      articles.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var articleCount = articles.length; 
      var article1 = articles.random(); 
      var article2 = article1; 
      var action1 = new RemoveAction(session, articles, article1); 
      var action2 = new RemoveAction(session, articles, article2); 
 
      var transaction = new Transaction( 
        "two removes on articles, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(articles.length, equals(articleCount)); 
 
      //articles.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to article actions", () { 
      var articleConcept = articles.concept; 
      var articleCount = articles.length; 
 
      var reaction = new ArticleReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var article = new Article(articles.concept); 
      article.title = 'vessel'; 
      article.author = 'undo'; 
      article.category = 'beer'; 
      article.quantity = 6773; 
      articles.add(article); 
      expect(articles.length, equals(++articleCount)); 
      articles.remove(article); 
      expect(articles.length, equals(--articleCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, articles, article); 
      addAction.doit(); 
      expect(articles.length, equals(++articleCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, article, "title", 'car'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class ArticleReaction implements ActionReactionApi { 
  bool reactedOnAdd    = false; 
  bool reactedOnUpdate = false; 
 
  react(BasicAction action) { 
    if (action is EntitiesAction) { 
      reactedOnAdd = true; 
    } else if (action is EntityAction) { 
      reactedOnUpdate = true; 
    } 
  } 
} 
 
void main() { 
  var repository = new Repository(); 
  var biblioDomain = repository.getDomainModels("Biblio");   
  assert(biblioDomain != null); 
  var mngtModel = biblioDomain.getModelEntries("Mngt");  
  assert(mngtModel != null); 
  var articles = mngtModel.articles; 
  testBiblioMngtArticles(biblioDomain, mngtModel, articles); 
} 
 
