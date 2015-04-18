part of biblio_mngt; 
 
// lib/gen/biblio/mngt/entries.dart 
 
class MngtEntries extends ModelEntries { 
 
  MngtEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Article"); 
    entries["Article"] = new Articles(concept); 
    concept = model.concepts.singleWhereCode("User"); 
    entries["User"] = new Users(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Article") { 
      return new Articles(concept); 
    } 
    if (concept.code == "User") { 
      return new Users(concept); 
    } 
    if (concept.code == "Borrowing") { 
      return new Borrowings(concept); 
    } 
    return null; 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Article") { 
      return new Article(concept); 
    } 
    if (concept.code == "User") { 
      return new User(concept); 
    } 
    if (concept.code == "Borrowing") { 
      return new Borrowing(concept); 
    } 
    return null; 
  } 
 
  Articles get articles => getEntry("Article"); 
  Users get users => getEntry("User"); 
 
} 
 
