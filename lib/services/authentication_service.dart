import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../core/enums/user_role.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Future<UserRole?> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return await getUserRole(userCredential.user!.uid);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      throw Exception(_handleFirebaseAuthError(e));
    } catch (e) {
      throw Exception('An unexpected error occurred during login.');
    }
  }

  Future<UserRole?> getUserRole(String userId) async {
    try {
      final DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      
      if (userDoc.exists && userDoc.data() != null) {
        final data = userDoc.data() as Map<String, dynamic>;
        final roleString = data['role'] as String?;
        if (roleString != null) {
          return UserRole.fromString(roleString);
        }
      }
      // If role is not defined, default to applicant or returning null based on logic.
      return UserRole.applicant;
    } catch (e) {
      throw Exception('Failed to fetch user profile.');
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  String _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      default:
        return e.message ?? 'Authentication failed.';
    }
  }
}
