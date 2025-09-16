import 'package:flutter/material.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});
  @override
  State<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _ageGroup = '';
  bool _terms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Survey Form',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Personal Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                },
                onChanged: (value) => _name = value,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) => _email = value,
              ),
              const SizedBox(height: 24),
              const Text('Age Group', style: TextStyle(fontSize: 18)),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Under 18'),
                    value: 'Under 18',
                    groupValue: _ageGroup,
                    onChanged: (value) {
                      setState(() {
                        _ageGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('18-35'),
                    value: '18-35',
                    groupValue: _ageGroup,
                    onChanged: (value) {
                      setState(() {
                        _ageGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('36-50'),
                    value: '36-50',
                    groupValue: _ageGroup,
                    onChanged: (value) {
                      setState(() {
                        _ageGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Over 50'),
                    value: 'Over 50',
                    groupValue: _ageGroup,
                    onChanged: (value) {
                      setState(() {
                        _ageGroup = value.toString();
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                title: const Text('I agree to the terms and conditions'),
                value: _terms,
                onChanged: (value) {
                  setState(() {
                    _terms = value!;
                  });
                },
              ),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _terms) {
                      // Form is valid and terms are accepted
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Survey Submitted!')),
                      );
                    } else if (!_terms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Please accept terms and conditions')),
                      );
                    }
                  },
                  child: const Text('Submit Survey'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
