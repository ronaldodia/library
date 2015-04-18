part of biblio_mngt; 
 
// lib/gen/biblio/mngt/borrowings.dart 
 
abstract class BorrowingGen extends ConceptEntity<Borrowing> { 
 
  BorrowingGen(Concept concept) : super.of(concept); 
 
  Reference get articleReference => getReference("article"); 
  set articleReference(Reference reference) => setReference("article", reference); 
  
  Article get article => getParent("article"); 
  set article(Article p) => setParent("article", p); 
  
  Reference get userReference => getReference("user"); 
  set userReference(Reference reference) => setReference("user", reference); 
  
  User get user => getParent("user"); 
  set user(User p) => setParent("user", p); 
  
  DateTime get borrowingDate => getAttribute("borrowingDate"); 
  set borrowingDate(DateTime a) => setAttribute("borrowingDate", a); 
  
  DateTime get returnDate => getAttribute("returnDate"); 
  set returnDate(DateTime a) => setAttribute("returnDate", a); 
  
  Borrowing newEntity() => new Borrowing(concept); 
  Borrowings newEntities() => new Borrowings(concept); 
  
} 
 
abstract class BorrowingsGen extends Entities<Borrowing> { 
 
  BorrowingsGen(Concept concept) : super.of(concept); 
 
  Borrowings newEntities() => new Borrowings(concept); 
  Borrowing newEntity() => new Borrowing(concept); 
  
} 
 
