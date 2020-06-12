import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathoncalorie/my_profile/profile.dart';
import 'package:hackathoncalorie/my_profile/user.dart';

class Database {
  final String uid;
  Database({this.uid});

  final CollectionReference profileCollection =
      Firestore.instance.collection('Profile-info');

  Future updateUserData(String name) async {
    return await profileCollection.document(uid).setData({
      'Name': name,
    });
  }

  Future updateUserData2(String gender) async {
    return await profileCollection.document(uid).setData({
      'Gender': gender,
    });
  }

  Future updateUserData3(
      String gender, double height, int weight, int age) async {
    return await profileCollection.document(uid).setData({
      'Gender': gender,
      'Weight': weight,
      'Height': height,
      'age': age,
    });
  }
  //profile list from snapshot

  List<Profile> _profileList(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Profile(
          age: doc.data['age'] ?? '',
          weight: doc.data['Weight'] ?? '',
          height: doc.data['Height'] ?? '');
    }).toList();
  }

  UserData _userDataSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        height: snapshot.data['Height'],
        weight: snapshot.data['Weight'],
        Age: snapshot.data['Age']);
  }

  //get method
  Stream<List<Profile>> get profile {
    return profileCollection.snapshots().map(_profileList);
  }

  Stream<UserData> get userData {
    return profileCollection.document(uid).snapshots().map(_userDataSnapshot);
  }
}