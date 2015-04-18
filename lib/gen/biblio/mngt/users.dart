part of biblio_mngt; 
 
// lib/gen/biblio/mngt/users.dart 
 
abstract class UserGen extends ConceptEntity<User> { 
 
  UserGen(Concept concept) : super.of(concept) { 
    Concept borrowingConcept = concept.model.concepts.singleWhereCode("Borrowing"); 
    setChild("borrowing", new Borrowings(borrowingConcept)); 
  } 
 
  UserGen.withId(Concept concept, String email) : super.of(concept) { 
    setAttribute("email", email); 
    Concept borrowingConcept = concept.model.concepts.singleWhereCode("Borrowing"); 
    setChild("borrowing", new Borrowings(borrowingConcept)); 
  } 
 
  String get email => getAttribute("email"); 
  set email(String a) => setAttribute("email", a); 
  
  String get firstName => getAttribute("firstName"); 
  set firstName(String a) => setAttribute("firstName", a); 
  
  String get lastName => getAttribute("lastName"); 
  set lastName(String a) => setAttribute("lastName", a); 
  
  String get phone => getAttribute("phone"); 
  set phone(String a) => setAttribute("phone", a); 
  
  String get privlege => getAttribute("privlege"); 
  set privlege(String a) => setAttribute("privlege", a); 
  
  Borrowings get borrowing => getChild("borrowing"); 
  
  User newEntity() => new User(concept); 
  Users newEntities() => new Users(concept); 
  
  int emailCompareTo(User other) { 
    return email.compareTo(other.email); 
  } 
 
} 
 
abstract class UsersGen extends Entities<User> { 
 
  UsersGen(Concept concept) : super.of(concept); 
 
  Users newEntities() => new Users(concept); 
  User newEntity() => new User(concept); 
  
} 
 
