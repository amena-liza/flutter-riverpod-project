import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/user_provider.dart';
import 'package:riverpod_files/screens/profile/profile_details_screen.dart';

import '../../models/user/user_model.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final usersRef = ref.watch(userProvider);

    handleOnPress(index, userDetailsData) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProfileDetailsScreen(
            userIndex: index,
            userDetails: userDetailsData
        );
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: usersRef.when(
          data: (userList){
            // update the state to be available by other routes
            // List<UserModel> userList = users.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: (_,index) {
                        return InkWell(
                          onTap: () => handleOnPress(index, userList[index]),
                          child: Card(
                            color: Colors.blue,
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: ListTile(
                              title: Text(
                                userList[index].firstname,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                userList[index].lastname,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              trailing: CircleAvatar(
                                backgroundImage: NetworkImage(userList[index].avatar),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          )
      )
    );
  }
}
