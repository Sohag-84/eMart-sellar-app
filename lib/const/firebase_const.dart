import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = firebaseAuth.currentUser;

//collectionName
const vendorCollection = "vendors";
const productCollection = "products";
const chatCollection = 'chats';
const messageCollection = "messages";
const orderCollection = "orders";
