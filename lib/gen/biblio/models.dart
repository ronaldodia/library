part of biblio_mngt; 
 
// lib/gen/biblio/models.dart 
 
class BiblioModels extends DomainModels { 
 
  BiblioModels(Domain domain) : super(domain) { 
    // fromJsonToModel function from dartling/lib/domain/model/transfer.json.dart 
 
    Model model = fromJsonToModel(biblioMngtModelJson, domain, "Mngt"); 
    MngtModel mngtModel = new MngtModel(model); 
    add(mngtModel); 
 
  } 
 
} 
 
