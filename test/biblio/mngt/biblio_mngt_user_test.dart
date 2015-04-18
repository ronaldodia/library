 
// test/biblio/mngt/biblio_mngt_user_test.dart 
 
import "package:unittest/unittest.dart"; 
import "package:dartling/dartling.dart"; 
import "package:biblio_mngt/biblio_mngt.dart"; 
 
testBiblioMngtUsers( 
    BiblioDomain biblioDomain, MngtModel mngtModel, Users users) { 
  DomainSession session; 
  group("Testing Biblio.Mngt.User", () { 
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
      expect(users.isEmpty, isFalse); 
    }); 
 
    test("Empty model", () { 
      mngtModel.clear(); 
      expect(mngtModel.isEmpty, isTrue); 
      expect(users.isEmpty, isTrue); 
      expect(users.errors.isEmpty, isTrue); 
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
      var json = mngtModel.fromEntryToJson("User"); 
      expect(json, isNotNull); 
 
      print(json); 
      //mngtModel.displayEntryJson("User"); 
      //mngtModel.displayJson(); 
      //mngtModel.display(); 
    }); 
 
    test("From JSON to model entry", () { 
      var json = mngtModel.fromEntryToJson("User"); 
      users.clear(); 
      expect(users.isEmpty, isTrue); 
      mngtModel.fromJsonToEntry(json); 
      expect(users.isEmpty, isFalse); 
 
      users.display(title: "From JSON to model entry"); 
    }); 
 
    test("Add user required error", () { 
      var userConcept = users.concept; 
      var userCount = users.length; 
      var user = new User(userConcept); 
      var added = users.add(user); 
      expect(added, isFalse); 
      expect(users.length, equals(userCount)); 
      expect(users.errors.length, greaterThan(0)); 
      expect(users.errors.toList()[0].category, equals("required")); 
 
      users.errors.display(title: "Add user required error"); 
    }); 
 
    test("Add user unique error", () { 
      var userConcept = users.concept; 
      var userCount = users.length; 
      var user = new User(userConcept); 
      var randomUser = users.random(); 
      user.email = randomUser.email; 
      var added = users.add(user); 
      expect(added, isFalse); 
      expect(users.length, equals(userCount)); 
      expect(users.errors.length, greaterThan(0)); 
 
      users.errors.display(title: "Add user unique error"); 
    }); 
 
    test("Not found user by new oid", () { 
      var dartlingOid = new Oid.ts(1345648254063); 
      var user = users.singleWhereOid(dartlingOid); 
      expect(user, isNull); 
    }); 
 
    test("Find user by oid", () { 
      var randomUser = users.random(); 
      var user = users.singleWhereOid(randomUser.oid); 
      expect(user, isNotNull); 
      expect(user, equals(randomUser)); 
    }); 
 
    test("Find user by attribute id", () { 
      var randomUser = users.random(); 
      var user = 
          users.singleWhereAttributeId("email", randomUser.email); 
      expect(user, isNotNull); 
      expect(user.email, equals(randomUser.email)); 
    }); 
 
    test("Find user by required attribute", () { 
      var randomUser = users.random(); 
      var user = 
          users.firstWhereAttribute("firstName", randomUser.firstName); 
      expect(user, isNotNull); 
      expect(user.firstName, equals(randomUser.firstName)); 
    }); 
 
    test("Find user by attribute", () { 
      var randomUser = users.random(); 
      var user = 
          users.firstWhereAttribute("phone", randomUser.phone); 
      expect(user, isNotNull); 
      expect(user.phone, equals(randomUser.phone)); 
    }); 
 
    test("Select users by attribute", () { 
      var randomUser = users.random(); 
      var selectedUsers = 
          users.selectWhereAttribute("phone", randomUser.phone); 
      expect(selectedUsers.isEmpty, isFalse); 
      selectedUsers.forEach((se) => 
          expect(se.phone, equals(randomUser.phone))); 
 
      //selectedUsers.display(title: "Select users by phone"); 
    }); 
 
    test("Select users by required attribute", () { 
      var randomUser = users.random(); 
      var selectedUsers = 
          users.selectWhereAttribute("firstName", randomUser.firstName); 
      expect(selectedUsers.isEmpty, isFalse); 
      selectedUsers.forEach((se) => 
          expect(se.firstName, equals(randomUser.firstName))); 
 
      //selectedUsers.display(title: "Select users by firstName"); 
    }); 
 
    test("Select users by attribute, then add", () { 
      var randomUser = users.random(); 
      var selectedUsers = 
          users.selectWhereAttribute("firstName", randomUser.firstName); 
      expect(selectedUsers.isEmpty, isFalse); 
      expect(selectedUsers.source.isEmpty, isFalse); 
      var usersCount = users.length; 
 
      var user = new User(users.concept); 
      user.email = 'cloud'; 
      user.firstName = 'video'; 
      user.lastName = 'country'; 
      user.phone = 'advisor'; 
      user.privlege = 'home'; 
      var added = selectedUsers.add(user); 
      expect(added, isTrue); 
      expect(users.length, equals(++usersCount)); 
 
      //selectedUsers.display(title: 
      //  "Select users by attribute, then add"); 
      //users.display(title: "All users"); 
    }); 
 
    test("Select users by attribute, then remove", () { 
      var randomUser = users.random(); 
      var selectedUsers = 
          users.selectWhereAttribute("firstName", randomUser.firstName); 
      expect(selectedUsers.isEmpty, isFalse); 
      expect(selectedUsers.source.isEmpty, isFalse); 
      var usersCount = users.length; 
 
      var removed = selectedUsers.remove(randomUser); 
      expect(removed, isTrue); 
      expect(users.length, equals(--usersCount)); 
 
      randomUser.display(prefix: "removed"); 
      //selectedUsers.display(title: 
      //  "Select users by attribute, then remove"); 
      //users.display(title: "All users"); 
    }); 
 
    test("Sort users", () { 
      users.sort(); 
 
      //users.display(title: "Sort users"); 
    }); 
 
    test("Order users", () { 
      var orderedUsers = users.order(); 
      expect(orderedUsers.isEmpty, isFalse); 
      expect(orderedUsers.length, equals(users.length)); 
      expect(orderedUsers.source.isEmpty, isFalse); 
      expect(orderedUsers.source.length, equals(users.length)); 
      expect(orderedUsers, isNot(same(users))); 
 
      //orderedUsers.display(title: "Order users"); 
    }); 
 
    test("Copy users", () { 
      var copiedUsers = users.copy(); 
      expect(copiedUsers.isEmpty, isFalse); 
      expect(copiedUsers.length, equals(users.length)); 
      expect(copiedUsers, isNot(same(users))); 
      copiedUsers.forEach((e) => 
        expect(e, equals(users.singleWhereOid(e.oid)))); 
      copiedUsers.forEach((e) => 
        expect(e, isNot(same(users.singleWhereId(e.id))))); 
 
      //copiedUsers.display(title: "Copy users"); 
    }); 
 
    test("True for every user", () { 
      expect(users.every((e) => e.firstName != null), isTrue); 
    }); 
 
    test("Random user", () { 
      var user1 = users.random(); 
      expect(user1, isNotNull); 
      var user2 = users.random(); 
      expect(user2, isNotNull); 
 
      //user1.display(prefix: "random1"); 
      //user2.display(prefix: "random2"); 
    }); 
 
    test("Update user id with try", () { 
      var randomUser = users.random(); 
      var beforeUpdate = randomUser.email; 
      try { 
        randomUser.email = 'offence'; 
      } on UpdateError catch (e) { 
        expect(randomUser.email, equals(beforeUpdate)); 
      } 
    }); 
 
    test("Update user id without try", () { 
      var randomUser = users.random(); 
      var beforeUpdateValue = randomUser.email; 
      expect(() => randomUser.email = 'baby', throws); 
      expect(randomUser.email, equals(beforeUpdateValue)); 
    }); 
 
    test("Update user id with success", () { 
      var randomUser = users.random(); 
      var afterUpdateEntity = randomUser.copy(); 
      var attribute = randomUser.concept.attributes.singleWhereCode("email"); 
      expect(attribute.update, isFalse); 
      attribute.update = true; 
      afterUpdateEntity.email = 'small'; 
      expect(afterUpdateEntity.email, equals('small')); 
      attribute.update = false; 
      var updated = users.update(randomUser, afterUpdateEntity); 
      expect(updated, isTrue); 
 
      var entity = users.singleWhereAttributeId("email", 'small'); 
      expect(entity, isNotNull); 
      expect(entity.email, equals('small')); 
 
      //users.display("After update user id"); 
    }); 
 
    test("Update user non id attribute with failure", () { 
      var randomUser = users.random(); 
      var beforeUpdateValue = randomUser.firstName; 
      var afterUpdateEntity = randomUser.copy(); 
      afterUpdateEntity.firstName = 'smog'; 
      expect(afterUpdateEntity.firstName, equals('smog')); 
      // users.update can only be used if oid, code or id is set. 
      expect(() => users.update(randomUser, afterUpdateEntity), throws); 
    }); 
 
    test("Copy Equality", () { 
      var randomUser = users.random(); 
      randomUser.display(prefix:"before copy: "); 
      var randomUserCopy = randomUser.copy(); 
      randomUserCopy.display(prefix:"after copy: "); 
      expect(randomUser, equals(randomUserCopy)); 
      expect(randomUser.oid, equals(randomUserCopy.oid)); 
      expect(randomUser.code, equals(randomUserCopy.code)); 
      expect(randomUser.email, equals(randomUserCopy.email)); 
      expect(randomUser.firstName, equals(randomUserCopy.firstName)); 
      expect(randomUser.lastName, equals(randomUserCopy.lastName)); 
      expect(randomUser.phone, equals(randomUserCopy.phone)); 
      expect(randomUser.privlege, equals(randomUserCopy.privlege)); 
 
      expect(randomUser.id, isNotNull); 
      expect(randomUserCopy.id, isNotNull); 
      expect(randomUser.id, equals(randomUserCopy.id)); 
 
      var idsEqual = false; 
      if (randomUser.id == randomUserCopy.id) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
 
      idsEqual = false; 
      if (randomUser.id.equals(randomUserCopy.id)) { 
        idsEqual = true; 
      } 
      expect(idsEqual, isTrue); 
    }); 
 
    test("New user action undo and redo", () { 
      var userConcept = users.concept; 
      var userCount = users.length; 
          var user = new User(users.concept); 
      user.email = 'beer'; 
      user.firstName = 'truck'; 
      user.lastName = 'objective'; 
      user.phone = 'discount'; 
      user.privlege = 'consciousness'; 
      users.add(user); 
      expect(users.length, equals(++userCount)); 
      users.remove(user); 
      expect(users.length, equals(--userCount)); 
 
      var action = new AddAction(session, users, user); 
      action.doit(); 
      expect(users.length, equals(++userCount)); 
 
      action.undo(); 
      expect(users.length, equals(--userCount)); 
 
      action.redo(); 
      expect(users.length, equals(++userCount)); 
    }); 
 
    test("New user session undo and redo", () { 
      var userConcept = users.concept; 
      var userCount = users.length; 
          var user = new User(users.concept); 
      user.email = 'school'; 
      user.firstName = 'phone'; 
      user.lastName = 'place'; 
      user.phone = 'election'; 
      user.privlege = 'message'; 
      users.add(user); 
      expect(users.length, equals(++userCount)); 
      users.remove(user); 
      expect(users.length, equals(--userCount)); 
 
      var action = new AddAction(session, users, user); 
      action.doit(); 
      expect(users.length, equals(++userCount)); 
 
      session.past.undo(); 
      expect(users.length, equals(--userCount)); 
 
      session.past.redo(); 
      expect(users.length, equals(++userCount)); 
    }); 
 
    test("User update undo and redo", () { 
      var user = users.random(); 
      var action = new SetAttributeAction(session, user, "firstName", 'home'); 
      action.doit(); 
 
      session.past.undo(); 
      expect(user.firstName, equals(action.before)); 
 
      session.past.redo(); 
      expect(user.firstName, equals(action.after)); 
    }); 
 
    test("User action with multiple undos and redos", () { 
      var userCount = users.length; 
      var user1 = users.random(); 
 
      var action1 = new RemoveAction(session, users, user1); 
      action1.doit(); 
      expect(users.length, equals(--userCount)); 
 
      var user2 = users.random(); 
 
      var action2 = new RemoveAction(session, users, user2); 
      action2.doit(); 
      expect(users.length, equals(--userCount)); 
 
      //session.past.display(); 
 
      session.past.undo(); 
      expect(users.length, equals(++userCount)); 
 
      session.past.undo(); 
      expect(users.length, equals(++userCount)); 
 
      //session.past.display(); 
 
      session.past.redo(); 
      expect(users.length, equals(--userCount)); 
 
      session.past.redo(); 
      expect(users.length, equals(--userCount)); 
 
      //session.past.display(); 
    }); 
 
    test("Transaction undo and redo", () { 
      var userCount = users.length; 
      var user1 = users.random(); 
      var user2 = users.random(); 
      while (user1 == user2) { 
        user2 = users.random();  
      } 
      var action1 = new RemoveAction(session, users, user1); 
      var action2 = new RemoveAction(session, users, user2); 
 
      var transaction = new Transaction("two removes on users", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      transaction.doit(); 
      userCount = userCount - 2; 
      expect(users.length, equals(userCount)); 
 
      users.display(title:"Transaction Done"); 
 
      session.past.undo(); 
      userCount = userCount + 2; 
      expect(users.length, equals(userCount)); 
 
      users.display(title:"Transaction Undone"); 
 
      session.past.redo(); 
      userCount = userCount - 2; 
      expect(users.length, equals(userCount)); 
 
      users.display(title:"Transaction Redone"); 
    }); 
 
    test("Transaction with one action error", () { 
      var userCount = users.length; 
      var user1 = users.random(); 
      var user2 = user1; 
      var action1 = new RemoveAction(session, users, user1); 
      var action2 = new RemoveAction(session, users, user2); 
 
      var transaction = new Transaction( 
        "two removes on users, with an error on the second", session); 
      transaction.add(action1); 
      transaction.add(action2); 
      var done = transaction.doit(); 
      expect(done, isFalse); 
      expect(users.length, equals(userCount)); 
 
      //users.display(title:"Transaction with an error"); 
    }); 
 
    test("Reactions to user actions", () { 
      var userConcept = users.concept; 
      var userCount = users.length; 
 
      var reaction = new UserReaction(); 
      expect(reaction, isNotNull); 
 
      biblioDomain.startActionReaction(reaction); 
          var user = new User(users.concept); 
      user.email = 'cloud'; 
      user.firstName = 'college'; 
      user.lastName = 'output'; 
      user.phone = 'agile'; 
      user.privlege = 'price'; 
      users.add(user); 
      expect(users.length, equals(++userCount)); 
      users.remove(user); 
      expect(users.length, equals(--userCount)); 
 
      var session = biblioDomain.newSession(); 
      var addAction = new AddAction(session, users, user); 
      addAction.doit(); 
      expect(users.length, equals(++userCount)); 
      expect(reaction.reactedOnAdd, isTrue); 
 
      var setAttributeAction = new SetAttributeAction( 
        session, user, "firstName", 'discount'); 
      setAttributeAction.doit(); 
      expect(reaction.reactedOnUpdate, isTrue); 
      biblioDomain.cancelActionReaction(reaction); 
    }); 
 
  }); 
} 
 
class UserReaction implements ActionReactionApi { 
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
  var users = mngtModel.users; 
  testBiblioMngtUsers(biblioDomain, mngtModel, users); 
} 
 
