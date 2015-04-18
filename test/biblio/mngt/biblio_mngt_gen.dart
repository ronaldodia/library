 
// test/biblio/mngt/biblio_mngt_gen.dart 
 
import "package:biblio_mngt/biblio_mngt.dart"; 
 
genCode(Repository repository) { 
  repository.gen("biblio_mngt"); 
} 
 
initData(Repository repository) { 
   var biblioDomain = repository.getDomainModels("Biblio"); 
   var mngtModel = biblioDomain.getModelEntries("Mngt"); 
   mngtModel.init(); 
   //mngtModel.display(); 
} 
 
void main() { 
  var repository = new Repository(); 
  genCode(repository); 
  //initData(repository); 
} 
 
