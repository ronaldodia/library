 
// web/biblio/mngt/biblio_mngt_web.dart 
 
import "dart:html"; 
 
import "package:dartling_default_app/dartling_default_app.dart"; 
import "package:biblio_mngt/biblio_mngt.dart"; 
 
initData(Repository repository) { 
   var biblioDomain = repository.getDomainModels("Biblio"); 
   var mngtModel = biblioDomain.getModelEntries("Mngt"); 
   mngtModel.init(); 
   //mngtModel.display(); 
} 
 
showData(Repository repository) { 
   var mainView = new View(document, "main"); 
   mainView.repo = repository; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var repository = new Repository(); 
  initData(repository); 
  showData(repository); 
} 
 
