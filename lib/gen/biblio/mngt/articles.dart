part of biblio_mngt; 
 
// lib/gen/biblio/mngt/articles.dart 
 
abstract class ArticleGen extends ConceptEntity<Article> { 
 
  ArticleGen(Concept concept) : super.of(concept) { 
    Concept borrowingConcept = concept.model.concepts.singleWhereCode("Borrowing"); 
    setChild("borrowing", new Borrowings(borrowingConcept)); 
  } 
 
  String get title => getAttribute("title"); 
  set title(String a) => setAttribute("title", a); 
  
  String get author => getAttribute("author"); 
  set author(String a) => setAttribute("author", a); 
  
  String get category => getAttribute("category"); 
  set category(String a) => setAttribute("category", a); 
  
  int get quantity => getAttribute("quantity"); 
  set quantity(int a) => setAttribute("quantity", a); 
  
  Borrowings get borrowing => getChild("borrowing"); 
  
  Article newEntity() => new Article(concept); 
  Articles newEntities() => new Articles(concept); 
  
} 
 
abstract class ArticlesGen extends Entities<Article> { 
 
  ArticlesGen(Concept concept) : super.of(concept); 
 
  Articles newEntities() => new Articles(concept); 
  Article newEntity() => new Article(concept); 
  
} 
 
