import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:she_sos_v1/themes/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _gender = 'Female';
  String _bloodGroup = 'O+';
  bool _isVolunteer = false;

  List<String> bloodGroupOptions = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  bool isChecked = false;

  void _openTerms() {
    print("Terms & Conditions clicked");
    // Navigate or launch URL
  }

  void _openPrivacy() {
    print("Privacy Policy clicked");
    // Navigate or launch URL
  }

  List<String> genderOptions = ['Female', 'Male', 'Other'];

  final List<Map<String, TextEditingController>> _contacts = [
    {'name': TextEditingController(), 'phone': TextEditingController()},
  ];
  void _register() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // — Personal Info —
            _buildSectionTitle('Personal Information'),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'City',
                prefixIcon: Icon(Icons.location_city_outlined),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _gender,
                    decoration: InputDecoration(labelText: 'Gender'),
                    items: genderOptions
                        .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                        .toList(),
                    onChanged: (v) => setState(() => _gender = v!),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    initialValue: _bloodGroup,
                    decoration: const InputDecoration(labelText: 'Blood Group'),
                    items: bloodGroupOptions
                        .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                        .toList(),
                    onChanged: (v) => setState(() => _bloodGroup = v!),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),

            // — Emergency Contacts —
            _buildSectionTitle('Emergency Contacts'),
            const SizedBox(height: AppSpacing.md),
            ..._contacts.asMap().entries.map(
              (entry) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.md),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: entry.value['name'],
                        decoration: InputDecoration(
                          labelText: 'Name ${entry.key + 1}',
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Expanded(
                      child: TextField(
                        controller: entry.value['phone'],
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(labelText: 'Phone'),
                      ),
                    ),
                    if (_contacts.length > 1)
                      IconButton(
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          final controllers = _contacts.removeAt(entry.key);
                          controllers['name']?.dispose();
                          controllers['phone']?.dispose();
                          setState(() {});
                        },
                      ),
                  ],
                ),
              ),
            ),
            TextButton.icon(
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add Contact'),
              onPressed: () => setState(
                () => _contacts.add({
                  'name': TextEditingController(),
                  'phone': TextEditingController(),
                }),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // — Volunteer —
            CheckboxListTile(
              value: _isVolunteer,
              onChanged: (v) => setState(() => _isVolunteer = v ?? false),
              title: const Text('Register as Volunteer'),
              subtitle: const Text('Help others in emergencies'),
              activeColor: AppColors.primary,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: AppSpacing.lg),

            // — Password —
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock_outline),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            // — Terms & Conditions —
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                        children: [
                          TextSpan(text: "I accept the "),
                          TextSpan(
                            text: "Terms & Conditions",
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _openTerms,
                          ),
                          TextSpan(text: " and acknowledge the "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(
                              color: Colors.red,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _openPrivacy,
                          ),
                          TextSpan(text: " for safety data processing."),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // — Register Button —
            ElevatedButton(
              onPressed: _register,
              child: const Text('Create Account'),
            ),

            const SizedBox(height: AppSpacing.xxl),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
      ),
    );
  }
}
