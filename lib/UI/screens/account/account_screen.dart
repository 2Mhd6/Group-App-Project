import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../theme/app_color.dart';
import 'edit_name_screen.dart';
import 'bloc/account_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<AccountBloc>();

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                const SizedBox(height: 32),
                BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, state) {
                    return Text(
                      state.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 4),
                const Text(
                  'Joined on 27 May 2030',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 32),
                const Divider(),
                _buildListTile(
                  'Edit Name',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditNameScreen(bloc: bloc),
                      ),
                    );
                  },
                ),
                _buildListTile('Help'),
                _buildListTile(
                  'Delete account',
                  color: AppColor.primaryAppColor,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const DeleteAccountDialog(),
                    );
                  },
                ),

                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 16,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: log out
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryAppColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 48,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Log out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 2,
              selectedItemColor: AppColor.primaryAppColor,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                // TODO: navigation
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Account',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt),
                  label: 'Orders',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildListTile(String title, {Color? color, VoidCallback? onTap}) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColor.primaryAppColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Do you really want delete your account?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 1),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Delete',
                      style: TextStyle(color: AppColor.primaryAppColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
